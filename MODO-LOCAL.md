# Modo local (para el día que el club se queda sin internet)

Esta guía es para los días en que en el club a veces hay internet y a
veces no. La idea: en vez de que el sistema entero dependa de la nube,
una notebook hace de "servidor" para ese día, todos los celulares se
conectan a su wifi, y todo funciona en esa red cerrada sin salir a
internet en ningún momento. Al otro día, con internet, se sigue usando
la nube como siempre.

**Lo que NO va a andar en modo local, y por qué:** las notificaciones
push (ni las automáticas ni el botón de prueba) necesitan que el
navegador de cada celular pueda contactar a los servidores de push de
Google/Apple por internet — eso no tiene vuelta, no hay forma de
hacerlo andar sin conexión. Tampoco va a andar el login con Google (por
la misma razón: necesita internet para hablar con Google), así que en
modo local se entra con email + contraseña en vez de Google. Y nadie
que esté fuera del club va a poder ver "En vivo (público)" ese día,
porque esa página no es pública en modo local — vive en la notebook,
no en internet.

## Paso 0 — una sola vez, con internet (hacelo antes, no en el club)

1. Instalar **Docker Desktop** (gratis): https://www.docker.com/products/docker-desktop/
   Abrilo una vez para que termine de instalarse y quede corriendo.

2. Instalar la **Supabase CLI**. Con Node instalado, desde una terminal:
   ```
   npm install -g supabase
   ```

3. Dentro de la carpeta del proyecto (`tanteador-racing-tw`), iniciar sesión y vincular con tu proyecto real:
   ```
   supabase login
   supabase link --project-ref qipsmmbhmurtpndvmwar
   ```

4. Traer una copia exacta del esquema de tu base real (tablas, columnas,
   permisos, todo) — esto es más confiable que ir juntando los archivos
   sueltos de `db/`, porque agarra la base tal cual está HOY, con todo lo
   que se corrió con el tiempo (incluido lo que se armó antes de que
   existieran esos archivos):
   ```
   supabase db pull
   ```
   Esto crea una carpeta `supabase/migrations/` con un archivo que es
   la "foto" completa de tu base actual.

   > Repetí este paso (`supabase db pull`) de vez en cuando, cada vez
   > que quieras que la copia local se actualice con cambios que hayas
   > hecho en la nube.

5. Levantar la base local (necesita Docker corriendo):
   ```
   supabase start
   ```
   La primera vez tarda un rato (baja las imágenes de Docker). Al
   terminar, te va a imprimir algo así — **guardá esos dos datos**:
   ```
   API URL: http://127.0.0.1:54321
   anon key: eyJ...
   ```
   (Si en algún momento perdés esos datos, `supabase status` te los
   vuelve a mostrar.)

## Paso 1 — el día del torneo, en el club

1. En la notebook, abrí una terminal en la carpeta del proyecto y corré:
   ```
   supabase start
   ```
   (si ya la habías levantado antes y no reiniciaste la compu, puede
   que ya esté corriendo).

2. Servir las páginas del sitio desde esa misma notebook. La forma más
   simple, con Node instalado:
   ```
   npx serve -l 8080
   ```
   (parado en la carpeta del proyecto). Vas a poder abrir el sitio en
   esa notebook como `http://localhost:8080`.

3. Conectar los celulares de árbitros/jugadores a la wifi de esa
   notebook (compartila como hotspot, o usá un router sin salida a
   internet — cualquiera de las dos sirve).

4. Buscar la IP de la notebook en esa red (en Windows: `ipconfig`,
   buscá algo como `192.168.1.50`). Desde los celulares, entrar a
   `http://192.168.1.50:8080` (esa IP, no localhost).

5. En la notebook (o en cualquier celular, una vez), entrar a
   `servidor.html` desde el sitio y cargar ahí la URL y la anon key
   local que anotaste en el Paso 0 — pero reemplazando `127.0.0.1` por
   la IP de la notebook en la red (por ejemplo
   `http://192.168.1.50:54321`), para que los OTROS celulares también
   puedan llegar a la base. Esto queda guardado en el navegador de ese
   dispositivo — hay que repetirlo en cada celular que vaya a usarse
   (los jugadores que solo miran no necesitan hacer nada, se conectan
   solos a lo que ya está en modo local si entran desde el mismo link
   que le compartas).

6. **Crear el usuario admin local** (la primera vez que uses el modo
   local; las cuentas de la nube NO existen en la base local, es una
   base nueva y separada):
   - Entrá a `index.html` en modo local, vas a ver el formulario de
     "email + contraseña" en vez del botón de Google.
   - Tocá "Crear cuenta" con tu email y una contraseña.
   - Abrí el Supabase Studio local (normalmente
     `http://127.0.0.1:54323`, o la IP de la notebook con ese mismo
     puerto), andá a SQL Editor, y corré (reemplazando el email):
     ```sql
     update profiles set role = 'admin', active = true
     where email = 'tu-email@ejemplo.com';
     ```
   - Volvé a entrar (cerrá sesión y logueate de nuevo) para que tome
     el rol de admin.

7. A partir de ahí, todo funciona igual que en la nube (cargar
   torneos, resultados, ver los tableros de OBS, etc.), salvo lo
   aclarado arriba (push y login con Google).

## Volver a la nube

Andá a `servidor.html` y tocá "Volver a la nube". Es instantáneo, no
hace falta reiniciar nada. Los resultados que cargaste en modo local
se quedan en la notebook — **no suben solos a la nube**. Si querés que
el historial/ranking de la nube incluya lo que se jugó ese día sin
internet, por ahora hay que volver a cargarlo a mano una vez que
tengas conexión (si esto se vuelve algo que hacés seguido, se puede
armar un paso que lo suba automático — avisame y lo vemos).
