-- ============================================================
-- SEED: ranking historico real 2025 (fuente: planilla del club)
-- ============================================================
-- Generado por db/generate_seed.py. Re-ejecutable: usa uuid5
-- deterministicos + ON CONFLICT DO NOTHING, no duplica si se
-- corre mas de una vez.
-- Correr despues de 001_schema.sql, 002_rls.sql, 003_finalize_match.sql.
-- ============================================================

insert into seasons (id, year) values ('50a63259-87bf-53f1-9550-5eae1fe9788d', 2025)
  on conflict (id) do nothing;

-- categorias (orden: 50, 56, 61A, 61B, 65)
insert into categories (id, name, display_order) values ('dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '50', 0)
  on conflict (id) do nothing;
insert into categories (id, name, display_order) values ('2c0c3f18-6c8c-5103-acbb-e45f0044e203', '56', 1)
  on conflict (id) do nothing;
insert into categories (id, name, display_order) values ('108bc169-5500-59e5-9b11-22db6844c07f', '61A', 2)
  on conflict (id) do nothing;
insert into categories (id, name, display_order) values ('ec1959a8-f474-56d3-9504-8c5c7d6939a5', '61B', 3)
  on conflict (id) do nothing;
insert into categories (id, name, display_order) values ('e0678232-cc67-5243-bcc0-17dea889a221', '65', 4)
  on conflict (id) do nothing;

-- clubes (nombre normalizado desde la planilla; variantes de tipeo
-- como 'Asoc. Espanola' / 'Asoc.Espanola' se agrupan en una sola fila)
insert into clubs (id, name, city) values ('f3499576-080b-51bb-85fc-99a925f230ab', 'Asoc.española Nqn', 'Neuquen')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('f69b931c-0e9c-5acf-9ccb-643e399bd174', 'Club Pelota', 'Monte Hermoso')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('25d4d852-ec3d-5d63-9913-f5d716072f08', 'Union Vasca', 'Bahia Blanca')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('68d7771c-159d-5c21-ba54-e672274e4399', 'Typac', 'C.rivadavia')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('16ad0839-a86c-50ef-8f95-dde6bdba9779', 'Sol De Mayo', 'Viedma')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('157b8d09-8010-5afa-8280-a7214b68dd11', 'Club Pelota', 'La Plata')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('b3409c1f-82d9-54b4-9654-0c62db1e48be', 'All Boys', 'La Pampa')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('230c7b2d-96b6-58c3-b618-252eee4f159e', 'Centro Basko', 'Necochea')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('b62e122d-cd78-5840-b782-66231da55634', 'Asoc.española', 'Neuquen')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Asoc. Española', 'Neuquen')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('663ea58f-35dd-57bb-92e8-846648259dba', 'Nahuel Huapi', 'Bariloche')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('03305ebd-b321-50e9-b770-b013ab7653eb', 'Ferro', 'Madryn')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('f05488d1-7dcd-51f5-a0a0-12b633a46be5', 'Asoc.española Esquel', 'Esquel')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('0a3b9cd7-6f52-5732-a3ee-59785f18a2de', 'Aosc.española Nqn', 'Neuquen')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Atletico Regina', 'Villa Regina')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Club Plottier', 'Plottier')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Club Cipolletti', 'Cipolletti')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('97e9a1e5-597f-5597-beb4-b3f682885588', 'Ferro', 'Pto. Madryn')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('4d3a9acc-515d-5fd4-9ff2-231be09caa0e', 'Cultural Argentino', 'Gral. Pico')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('29229320-eec6-5b2e-93f1-132d096c80ac', 'Racing', 'Trelew')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Don Bosco', 'Rawson')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'Club De Pelota', 'La Plata')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('1039a92b-f06d-5f40-a83f-91b1ebca24cb', 'Asoc. Española', 'Esquel')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('c7e61cd5-1c05-56cf-95cd-39de09c61441', 'Boxing', 'Rio Gallegos')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('7f7f0668-efff-580d-bb8a-c3def1d9b90b', 'Rio Gallegos', 'Rio Gallegos')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('6a615aad-09af-5097-9faf-a7698a135bd9', 'Del Prado Español', 'La Pampa')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('3c43b215-6772-53f6-9d77-21a8c518b96a', 'Asoc.española', 'Esquel')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('885f7c09-198e-5739-840d-62b9cab7b223', 'Typac', 'C. Rivadavia')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Centro Vasco', 'Mdq')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('014ae825-a6ed-5700-8e46-203d3ade5cf6', 'Huracan', 'Tres Arroyos')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('e01cade7-1342-5a0c-8b6d-65f3cc571de1', 'Deseado Jr', 'Pto.deseado')
  on conflict (name, city) do nothing;
insert into clubs (id, name, city) values ('acc21ae6-2da9-5477-846d-703103d7a12b', 'Club Plottier', 'Neuquen')
  on conflict (name, city) do nothing;

-- torneos: un torneo por sede del circuito 2025 (datos historicos,
-- cargados ya finalizados; no tienen fixture asociado)
insert into tournaments (id, season_id, name, venue, city, status) values ('17b55347-3c5d-54ff-8f79-cd2a5cfb7885', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'Torneo Patagonico de Veteranos Esquel', 'Esquel', 'Esquel', 'finished')
  on conflict (id) do nothing;
insert into tournaments (id, season_id, name, venue, city, status) values ('3b9a9850-61ba-509b-8559-d5c31295f1a8', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'Torneo Patagonico de Veteranos Cipolletti', 'Cipolletti', 'Cipolletti', 'finished')
  on conflict (id) do nothing;
insert into tournaments (id, season_id, name, venue, city, status) values ('5d2c0a6c-461e-57ad-a9de-ce0962b90b36', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'Torneo Patagonico de Veteranos Union Vasca', 'Union Vasca', 'Union Vasca', 'finished')
  on conflict (id) do nothing;
insert into tournaments (id, season_id, name, venue, city, status) values ('c4bdfd09-cfb7-5c20-8571-399832a9a78b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'Torneo Patagonico de Veteranos Rawson', 'Rawson', 'Rawson', 'finished')
  on conflict (id) do nothing;

-- jugadores (planilla real, 211 filas -> agrupadas por identidad).
-- Identidad = (apellido, nombre) normalizados; si ese mismo nombre
-- aparecio con clubes distintos en el archivo, se cargan como dos
-- jugadores separados (ver AVISO mas abajo) en vez de fusionarlos.
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2bda21ef-48c2-5442-b2dc-b5e797738477', 'Jose Luis', 'Lozano', 'Jose Luis Lozano', 'f3499576-080b-51bb-85fc-99a925f230ab', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('806e94ed-1994-5349-9abb-34c9209ac061', 'Miguel', 'Araya', 'Miguel Araya', 'f69b931c-0e9c-5acf-9ccb-643e399bd174', 'Monte Hermoso')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a52d024a-d0d1-58ea-bab7-fb7e8f9102f9', 'Francisco', 'De Uriarte', 'Francisco De Uriarte', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('38c2b574-c161-5eb1-acbd-5ca4367f7e1a', 'Juan Pablo', 'Baztan', 'Juan Pablo Baztan', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e55b621d-0c7b-5657-b323-8598c1704718', 'Ricardo', 'Gil', 'Ricardo Gil', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('6ce9a5cc-78af-568c-bf67-7975ea3500ff', 'Alejandro', 'Mendez', 'Alejandro Mendez', '16ad0839-a86c-50ef-8f95-dde6bdba9779', 'Viedma')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('675f176e-51b6-5f37-acc6-efa3c09039a9', 'Silvio', 'Coppis', 'Silvio Coppis', '16ad0839-a86c-50ef-8f95-dde6bdba9779', 'Viedma')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('af69fdcf-5684-563e-8848-3633439ec0b7', 'Javier', 'Vigheto', 'Javier Vigheto', '157b8d09-8010-5afa-8280-a7214b68dd11', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1476573d-e18a-5563-a9da-dcd487e2c965', 'Roberto', 'Marrero', 'Roberto Marrero', '157b8d09-8010-5afa-8280-a7214b68dd11', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('357e0756-8164-5fef-be47-d41fa2d5b3ed', 'Dario', 'Sanchez', 'Dario Sanchez', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('fb21a8e4-42d4-533d-a6bb-2902ff2a53b5', 'Osvaldo', 'Lucero', 'Osvaldo Lucero', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8d9f2cd3-2acd-554c-8c91-b9e947469a81', 'Pablo', 'Nutrichi', 'Pablo Nutrichi', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('797ab56a-f044-5b71-b3f7-6dfc1fb6faf6', 'Gaston', 'Rodriguez', 'Gaston Rodriguez', '230c7b2d-96b6-58c3-b618-252eee4f159e', 'Necochea')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('db347aa0-8f2f-5ef8-9dad-9c2e39e8263d', 'Jose', 'Arrechea', 'Jose Arrechea', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('04d42582-3198-52ba-9d0d-db4c21dc25e5', 'Jonatan', 'Danuncio', 'Jonatan Danuncio', '230c7b2d-96b6-58c3-b618-252eee4f159e', 'Necochea')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('4945c853-f343-5ce9-b3d1-6635a65582b0', 'Javier', 'Lombardi', 'Javier Lombardi', '230c7b2d-96b6-58c3-b618-252eee4f159e', 'Necochea')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e89d37c3-b18d-5521-acfb-910002e5c679', 'Jorge', 'Attendemi', 'Jorge Attendemi', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('29eec4de-1b39-5c82-b83d-d874c3b6360c', 'Nicodemo', 'Zagari', 'Nicodemo Zagari', '16ad0839-a86c-50ef-8f95-dde6bdba9779', 'Viedma')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9fc9cb04-e62d-5053-9977-783339661ffd', 'Mario', 'Moron', 'Mario Moron', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('409da0e2-201d-5c86-9924-033684685c75', 'Carlos', 'Olivella', 'Carlos Olivella', 'b62e122d-cd78-5840-b782-66231da55634', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9b56670e-4164-5462-9779-624467f4f4e7', 'Manuel', 'Cuesta', 'Manuel Cuesta', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c864d39d-287f-5a9e-9259-48759117d872', null, 'Frabiani', 'Frabiani', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('09fd5248-9364-5a1e-8eed-f2654c835bcc', 'Dino', 'Garcia', 'Dino Garcia', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c550e978-8416-5dac-8dd6-369d7bf2e8cd', 'Hugo', 'Medina', 'Hugo Medina', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('afcc6d27-8aa0-5b1b-9fc8-394596ef7978', 'Mariano', 'Salas', 'Mariano Salas', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9593d33c-ff05-52ca-bbc4-8bc8415a9bcb', 'Omar', 'Garmendia', 'Omar Garmendia', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('6e6cc171-a6cf-58a9-8f73-d6f76e74edbf', 'Alejandro', 'Retamal', 'Alejandro Retamal', '16ad0839-a86c-50ef-8f95-dde6bdba9779', 'Viedma')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('98e8627b-8755-5a7e-9399-8fd6ed96a96d', 'Mauricio', 'Freiberger', 'Mauricio Freiberger', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a2994e88-ad8a-5a78-9c98-fbff8e087277', 'Ismael', 'Morales', 'Ismael Morales', '03305ebd-b321-50e9-b770-b013ab7653eb', 'Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bc558ba7-d0f0-5f11-94f7-e026fac70727', 'Guillermo', 'Gaviglia', 'Guillermo Gaviglia', 'f05488d1-7dcd-51f5-a0a0-12b633a46be5', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e87505a2-975a-5572-8003-f8a8c492c9e5', 'Martin', 'Guzman', 'Martin Guzman', 'f05488d1-7dcd-51f5-a0a0-12b633a46be5', 'Esquel')
  on conflict (id) do nothing;
-- AVISO: Marcelo Gabis aparece con mas de un club/ciudad segun la hoja -> revisar si es la misma persona
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2c676921-0523-5cfa-81f5-e67142b7846a', 'Marcelo', 'Gabis', 'Marcelo Gabis', '0a3b9cd7-6f52-5732-a3ee-59785f18a2de', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a6c82ff4-09b2-5535-a8a7-892bfd8acb6d', 'Javier', 'Lecot', 'Javier Lecot', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('31f05041-f995-502e-8ecf-b168fb234396', 'Guillermo', 'Lopez', 'Guillermo Lopez', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f8ed487d-0b2c-599f-a5c4-5c9ea9b285f1', 'Dino', 'Codermatz', 'Dino Codermatz', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7bfbb151-2812-5ce9-8a4b-3d32f623ed84', 'Claudio', 'Riquelme', 'Claudio Riquelme', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('58c7d093-6fd7-5a27-a425-b7b9729850a9', 'Nestor', 'Arevalo', 'Nestor Arevalo', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('53c2fc8e-cdfe-53f9-8254-7d5a44f74bef', null, 'Hernandez', 'Hernandez', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('18e3b7c7-55d3-594e-8299-1783d4b8f434', 'Miguel', 'Alcantar', 'Miguel Alcantar', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f5654d4a-432a-52fd-b680-c9ac79968f8e', 'Jorge', 'Linares', 'Jorge Linares', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0beac85a-ba8b-55f5-b5fd-8a41064a03be', 'Jorge', 'Arocena', 'Jorge Arocena', '4d3a9acc-515d-5fd4-9ff2-231be09caa0e', 'Gral. Pico')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2b603172-e743-50c8-9f2a-17d548d64906', 'Viviano', 'Hernando', 'Viviano Hernando', '4d3a9acc-515d-5fd4-9ff2-231be09caa0e', 'Gral. Pico')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b4bb2800-a910-5608-99c0-b888b903fa07', 'Marcos', 'Salamida', 'Marcos Salamida', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('34109b6e-7e14-5a7a-aaf4-7c35666867a1', 'Carlos', 'Moreno', 'Carlos Moreno', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a5b5e9a0-6d47-5db4-8100-89952fa96409', 'Pablo', 'Sachetti', 'Pablo Sachetti', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('77d11f53-cd5c-50c5-b733-18c6e2109a3a', 'Hugo', 'Aguilar', 'Hugo Aguilar', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('00aa42a3-b564-5acb-bd61-174654ad10f8', 'Rafael', 'Jones', 'Rafael Jones', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e570eac4-8db2-555b-bad0-8192e3252fbb', 'Alfonso', 'Painenau', 'Alfonso Painenau', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('21ec880c-8d76-5600-914e-50ab47e116f6', 'Roberto', 'Rezzonico', 'Roberto Rezzonico', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a484c2c3-8096-5094-9d80-af8df8be8bec', 'Gerardo', 'Ramos', 'Gerardo Ramos', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f64ee520-7361-53e3-bd54-d56069d1e9e1', 'Silvio', 'Royo', 'Silvio Royo', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1ca069e4-f5b1-5885-a0ba-3e80124f176e', 'Ricardo', 'Benvenutto', 'Ricardo Benvenutto', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('6fb42a9f-4893-543e-ae6d-278b2e94f882', 'Fabio', 'Lara', 'Fabio Lara', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('96e76add-4b4b-5bc1-bc0a-718907f1e0c8', 'Jorge', 'Mayorga', 'Jorge Mayorga', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('598cc4f3-6722-574b-a522-4e56a915c4e5', 'Luis', 'Sarchioni', 'Luis Sarchioni', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('673eea1c-268c-5fdd-a76f-0b7f32ec6409', 'Alberto', 'Abadie', 'Alberto Abadie', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('089ab061-cc19-5adb-9a6e-a43e5dc0847c', 'Adrian', 'Acuña', 'Adrian Acuña', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('615d614d-0316-547e-b957-32d2dcf9bc37', 'Gustavo', 'Dubie', 'Gustavo Dubie', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('eb2af2a8-358e-5ed7-9047-63c7995893e1', 'Juan', 'Vidal', 'Juan Vidal', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('313f6904-c019-59a8-903b-554430cb82cd', 'Hugo', 'Gilardoni', 'Hugo Gilardoni', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('600e6f7b-97e1-5bd4-8c2a-5ecd47600db6', 'Daniel', 'Real', 'Daniel Real', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f8c6d56d-9cec-5cbf-9e6b-7fd8905f91cd', 'Carlos', 'Salamida', 'Carlos Salamida', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3539fb6d-5c2f-58bc-9b8c-fbcc4579d20f', 'Carlos', 'Castro', 'Carlos Castro', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b3f92d62-0a3b-54d9-982e-4ee5672eb4df', 'Fabio', 'Franzoni', 'Fabio Franzoni', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('ea4ce6ff-3aa5-543d-ba1a-91b2d5e3aa82', 'Marcelo', 'De Uriarte', 'Marcelo De Uriarte', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0b41bb40-4420-5363-b8d2-91f198c4dd09', 'Juan', 'Arrillaga', 'Juan Arrillaga', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1e16fac1-615f-52ee-a448-2c0b06d9e57c', 'Carlos', 'Ingani', 'Carlos Ingani', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3f7c1cc1-482b-5e18-8949-24c05a8005ea', 'Juan Carlos', 'Maida', 'Juan Carlos Maida', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('71a531fc-6a38-57bd-80c5-8acc91b29791', 'Gerardo', 'Solorza', 'Gerardo Solorza', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8ee839c0-344e-5e30-9c1a-84a522be2130', 'Sergio', 'Iralde', 'Sergio Iralde', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('ea016aea-0888-5f6f-9274-6c12851f4dee', 'Tomas', 'Real', 'Tomas Real', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('fd09726b-7c72-5bfc-b2f3-6d336623c06e', 'Ricardo', 'De Oro', 'Ricardo De Oro', '1039a92b-f06d-5f40-a83f-91b1ebca24cb', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e87fa3c9-edfa-53a3-ae76-e0424f7c529f', 'Carlos', 'Fonseca', 'Carlos Fonseca', '1039a92b-f06d-5f40-a83f-91b1ebca24cb', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('65120eae-e604-5012-ae18-b6d4984d8114', 'Marcelo', 'Palandri', 'Marcelo Palandri', '1039a92b-f06d-5f40-a83f-91b1ebca24cb', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bde31fb5-f594-56d8-b51b-c28c81228674', 'Carlos', 'Bravo', 'Carlos Bravo', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('16be5bd6-8934-5e97-bcb0-3a3b78db6397', 'Simon', 'Aguilar', 'Simon Aguilar', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f0881692-13d2-549d-8658-f619aaa1a99d', 'Daniel', 'Fradegas', 'Daniel Fradegas', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('74117289-7108-54ed-812b-3973b206de8d', 'Gustavo', 'Macedo', 'Gustavo Macedo', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c0f4c98e-873e-593c-ae89-e0ab15c77bfc', 'Oscar', 'Turbille', 'Oscar Turbille', 'c7e61cd5-1c05-56cf-95cd-39de09c61441', 'Rio Gallegos')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c39f7824-6882-5d57-a048-2a1ad8d3803f', 'Fito', 'Licciardi', 'Fito Licciardi', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('28be597b-5ac4-5ecd-b25e-12697424c931', 'Juan Carlos', 'Rezzonico', 'Juan Carlos Rezzonico', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
-- AVISO: Juan C Arredondo aparece con mas de un club/ciudad segun la hoja -> revisar si es la misma persona
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8563e980-7c64-5595-bddd-e061998858f6', 'Juan C', 'Arredondo', 'Juan C Arredondo', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('87875cd9-ae33-5cdc-ba08-094fc19f9700', 'Juan', 'Echevers', 'Juan Echevers', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('628b9d65-c887-55a6-b25e-fe99e64e225e', 'Jorge', 'Pirotta', 'Jorge Pirotta', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9c8ac7eb-7c51-5785-85c2-667d46954470', 'Eduardo', 'Chizzoli', 'Eduardo Chizzoli', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a9577363-27f4-5432-95c8-14396ee10a01', 'Miguel', 'Rosales', 'Miguel Rosales', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bf31adb3-0afd-592c-afdf-bb9f42c59ea5', 'Omar', 'Ortiz', 'Omar Ortiz', '1039a92b-f06d-5f40-a83f-91b1ebca24cb', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('ee714212-c18c-506a-9ce3-e861feed3bd4', 'Luis', 'Miguel', 'Luis Miguel', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c25d6371-550b-5dfd-ad7a-fe6b86f10c0e', 'Gabriel', 'Gregoide', 'Gabriel Gregoide', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9f65fb77-3dbe-58a2-a5eb-2a167fe24fcc', 'Jorge', 'Conde', 'Jorge Conde', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c4d1bd59-5182-50e6-8583-d45fd8f18360', 'Seleme', 'Zafar', 'Seleme Zafar', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('31a78290-af09-519c-b89f-2b71b89c8788', 'Ricardo', 'Mutti', 'Ricardo Mutti', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2ef3f6d8-1787-5511-af1f-39c992fe814c', 'Fernando', 'Ventimiglia', 'Fernando Ventimiglia', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f5cd29f5-3a16-5479-9b8b-2a6377b1a72d', 'Nestor', 'Sandi', 'Nestor Sandi', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8a10664f-433f-56ae-a82d-d042ef439865', 'Omar', 'Carro', 'Omar Carro', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a42077f9-08ef-52c6-b313-529babad9575', 'Fabio', 'Durant', 'Fabio Durant', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
-- AVISO: Marcelo Gabis aparece con mas de un club/ciudad segun la hoja -> revisar si es la misma persona
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2047a841-5f09-5530-b4ee-859c23dcd512', 'Marcelo', 'Gabis', 'Marcelo Gabis', '4ec75b03-141e-5c34-96e2-8ed52b6018a4', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b61dcd48-bc78-541f-9dc7-588628c2d829', 'Lazaro', 'Ortega', 'Lazaro Ortega', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d44472ab-430f-5236-ac26-88c3923c1bb5', 'Eduardo', 'Aizpurua', 'Eduardo Aizpurua', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('eb9c881b-dce1-5f68-a4b6-2668bbdd5070', 'Jose', 'Zapata', 'Jose Zapata', '7f7f0668-efff-580d-bb8a-c3def1d9b90b', 'Rio Gallegos')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('fb2ecc30-2c14-5bd8-b14d-0873754d2eb1', 'Walter', 'Pastor', 'Walter Pastor', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('89f2f84a-f883-548d-ba65-e07732acf7ab', 'Adrian', 'Pessoa', 'Adrian Pessoa', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bc32cbd6-8b55-58a6-bbd5-fec5f0e7ae13', 'Hector', 'Lara', 'Hector Lara', '6a615aad-09af-5097-9faf-a7698a135bd9', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('83d9135e-8652-5fb8-99a4-4fdd1c5ad031', 'Juan', 'Desuque', 'Juan Desuque', '6a615aad-09af-5097-9faf-a7698a135bd9', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7a6a827a-4405-561d-9a1c-1132e7f968c2', 'Daniel', 'Gerez', 'Daniel Gerez', '157b8d09-8010-5afa-8280-a7214b68dd11', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('29a03ae2-0391-556b-8814-77b3c1730c3d', 'Dardo', 'Lanata', 'Dardo Lanata', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('61d2e2c1-6bda-585a-b2b7-a5be459ffba9', 'Carlos', 'Garrido', 'Carlos Garrido', '4d3a9acc-515d-5fd4-9ff2-231be09caa0e', 'Gral. Pico')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('07126796-e5ee-559b-900a-727653e87d9d', 'Ricardo', 'Scattini', 'Ricardo Scattini', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c8dc54aa-ba84-5a53-b447-02369cc03d87', 'Marcelo', 'Garcia', 'Marcelo Garcia', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('af2d1409-0a0c-5590-a546-f1be84fadd20', 'Ramon', 'Gonzalez', 'Ramon Gonzalez', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('ee983186-6b9f-5cd3-af9e-7d425e2f1ada', 'Ricardo', 'Quiroga', 'Ricardo Quiroga', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('46647976-9780-5cd8-a989-d03f7da9dd04', 'Dario', 'Oberlander', 'Dario Oberlander', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('5a8e5d8c-3b9b-5464-a09a-60d850ca8a92', 'Carlos', 'Manzanares', 'Carlos Manzanares', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('01ade758-fa8a-54d0-a4f8-dcf4b6b77165', 'David', 'Perez', 'David Perez', '4d3a9acc-515d-5fd4-9ff2-231be09caa0e', 'Gral. Pico')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('5af2e78b-d48b-519b-8900-5ef459f73fa5', 'Fernando', 'Videla', 'Fernando Videla', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('35e44ef4-87af-5dfa-936f-d4e7008d1783', 'Hector', 'Calderero', 'Hector Calderero', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2ae5702f-08bc-597d-baf5-2bb278cf5a5c', 'Ricardo', 'Sardi', 'Ricardo Sardi', '7f7f0668-efff-580d-bb8a-c3def1d9b90b', 'Rio Gallegos')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a729d1ea-0e5b-5532-b2b4-2793ebdf05dd', 'Enrique', 'Dominguez', 'Enrique Dominguez', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0d2cd468-f069-55c8-bfb1-9e6e45e7ccb7', 'Oscar', 'Heras', 'Oscar Heras', '885f7c09-198e-5739-840d-62b9cab7b223', 'C. Rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7e643b88-c887-506c-91e2-20fb9c3173cf', 'Cesar', 'Jeckel', 'Cesar Jeckel', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('37f4f8fb-3454-5763-88f2-612aca52d844', 'Alfredo', 'Valdez', 'Alfredo Valdez', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d47e6470-8143-5321-9709-dc606962718f', 'Roberto', 'Bernal', 'Roberto Bernal', 'b62e122d-cd78-5840-b782-66231da55634', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b7944c4c-9257-5e2a-adad-ec2bec24de15', 'Jorge', 'Rudolf', 'Jorge Rudolf', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0a78a15c-7c59-5e3f-ab03-54f667c81c51', 'Omar', 'Feniger', 'Omar Feniger', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3d3fc59f-2686-5ae7-abc7-b1e360f80916', 'Jorge', 'Jauregui', 'Jorge Jauregui', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('98410190-d65c-58ab-bd11-7f76fec0f74c', 'Jose Maria', 'Ferre', 'Jose Maria Ferre', '68d7771c-159d-5c21-ba54-e672274e4399', 'C.rivadavia')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3ebf1bde-be8b-579d-9a5a-ed6fe305620b', 'Jorge', 'Larrañaga', 'Jorge Larrañaga', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a66b9bac-881e-5a9b-b843-f8991c444140', 'Dario', 'Jerez', 'Dario Jerez', 'b62e122d-cd78-5840-b782-66231da55634', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f557bedd-f20c-5faf-b07c-90944214d3a8', 'Eladio', 'Diaz', 'Eladio Diaz', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('4093ccab-4da2-5945-856d-4989500bc08f', 'Carlos', 'Ordines', 'Carlos Ordines', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bdb5f4e7-7710-5552-9e09-8ab532c321b4', 'Humberto', 'Bahamonde', 'Humberto Bahamonde', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3a4e231c-2056-5254-9b4f-36cfdadba051', 'Carlos', 'Zapiola', 'Carlos Zapiola', '03305ebd-b321-50e9-b770-b013ab7653eb', 'Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0c986f1b-eca7-55d2-bb6a-806354c8a57e', 'Marcelo', 'Fernandez', 'Marcelo Fernandez', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bcec2433-1d3a-5e5c-9844-bfa520f90874', 'Fabio', 'Duran', 'Fabio Duran', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9eeb5efa-6478-543b-8139-5d5f9d9fa762', 'Hector', 'Tenchini', 'Hector Tenchini', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('da091f39-50ed-5628-af79-1b491b4b131a', 'Julian', 'Rochet', 'Julian Rochet', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('47a5f8d6-4ad2-58b5-95c7-47e09cf3890f', 'Leonardo', 'Maida', 'Leonardo Maida', '25d4d852-ec3d-5d63-9913-f5d716072f08', 'Bahia Blanca')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a0057ec2-a341-5e92-823f-d5829adc6700', 'Edgard', 'Sandanella', 'Edgard Sandanella', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2b876769-6144-5c69-adca-96120c0bb49e', 'Gustavo', 'Cimadevilla', 'Gustavo Cimadevilla', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('265fd5d3-0081-5092-b78f-0f0c4a973675', 'Hector', 'Toranzo', 'Hector Toranzo', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('20d98a81-8a64-5d2b-9aaf-1b86c989af13', 'Hector', 'Lista', 'Hector Lista', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b33a5f7e-642b-534a-b544-25332eab66f6', 'Nestor', 'Alarcon', 'Nestor Alarcon', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
-- AVISO: Juan C Arredondo aparece con mas de un club/ciudad segun la hoja -> revisar si es la misma persona
insert into players (id, first_name, last_name, display_name, club_id, city) values ('9f5799fe-659b-5cfa-a709-c86948598803', 'Juan C', 'Arredondo', 'Juan C Arredondo', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0207f013-f274-5c74-b220-7057d1d5755a', 'Camilo', 'Lopez', 'Camilo Lopez', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('05c71a86-b43b-531b-9feb-bb3bd23d06f3', 'Hipolito', 'Perez', 'Hipolito Perez', 'b62e122d-cd78-5840-b782-66231da55634', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d2a8389e-8015-5888-9dfe-65e44911ee08', 'Edgardo', 'Vidal', 'Edgardo Vidal', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('5301051f-b99a-5090-a4b6-cfcf046dc320', 'Carlos', 'Romero', 'Carlos Romero', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b7e840e4-d2a2-5705-967c-ff686fc6ed93', 'Raul', 'Ibarzabal', 'Raul Ibarzabal', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('14278f81-eb66-5596-a6be-9776fbec5587', 'Oscar', 'Carreras', 'Oscar Carreras', 'f69b931c-0e9c-5acf-9ccb-643e399bd174', 'Monte Hermoso')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a51a688e-6f58-5352-8fc8-3388bf2203de', 'Juan', 'Vargas', 'Juan Vargas', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('96959350-fd82-53ad-859e-2e47fccc62ba', 'Miguel', 'Silva', 'Miguel Silva', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1300605e-fd41-5cf2-bc4e-b938857d2e55', 'Agustin', 'Lanusse', 'Agustin Lanusse', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a34ab38d-23ba-5b6e-9e0c-2088c3bbbb8c', 'Ariel', 'Lloyd', 'Ariel Lloyd', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('02dfe66d-351f-5280-be84-7345f018fc26', 'Keny', 'Willians', 'Keny Willians', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1cd779d8-98f9-5a03-9c6b-0af91479e626', 'Miguel', 'De Los Santos', 'Miguel De Los Santos', 'c7e61cd5-1c05-56cf-95cd-39de09c61441', 'Rio Gallegos')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f4fa4098-35b9-57bf-92b4-cd535cd47be0', null, 'Picabea;', 'Picabea;', '97e9a1e5-597f-5597-beb4-b3f682885588', 'Pto. Madryn')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7d739440-4425-5ef2-8845-bbf1fb6ed233', 'Carlos', 'Ferrari', 'Carlos Ferrari', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('00bddf1c-1b64-54b1-a1c7-20343ba54c5a', 'Carlos', 'Dettler', 'Carlos Dettler', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0e953993-9e65-53e3-a20d-e709c02003a8', 'Alberto', 'Totikian', 'Alberto Totikian', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d0cda343-813e-5185-a773-ca25086dc825', 'Luis', 'Barau', 'Luis Barau', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0c266d1f-c3c9-5fee-8bfb-f6a832069f7b', 'Antonio', 'Pasero', 'Antonio Pasero', '6a615aad-09af-5097-9faf-a7698a135bd9', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8abc2ca1-9cb4-58fd-915f-42cad573eec9', 'Roberto', 'Crespi', 'Roberto Crespi', '6a615aad-09af-5097-9faf-a7698a135bd9', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('cf083128-de8c-5d70-aeaa-2b515d6ebb27', 'Carlos', 'Ordinez', 'Carlos Ordinez', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d515b6a2-3a97-575f-8b92-a4bc9b5a5538', 'Oscar', 'Oliver', 'Oscar Oliver', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b38cb78b-b64b-5cf5-860a-c0830c21d80b', 'Hugo', 'Puglisi', 'Hugo Puglisi', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('b713de84-2447-5aea-9f91-af37040f090b', 'Mariano', 'Frumboli', 'Mariano Frumboli', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('4eb8b35c-f46c-55f3-b5fb-0ec621b3c92e', 'Jorge', 'O''lery', 'Jorge O''lery', '014ae825-a6ed-5700-8e46-203d3ade5cf6', 'Tres Arroyos')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7cf4d2e8-a0b8-59f1-8ade-4f3a3f6f7c59', 'Omar', 'Roman', 'Omar Roman', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3b27151e-ec5c-5007-9af2-533795be8447', 'Julian', 'Ochoa', 'Julian Ochoa', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('4514ce8b-86cb-5f32-a494-54bffed341ca', 'Carmelo', 'Pelleretti', 'Carmelo Pelleretti', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8a99097e-21d8-57b7-ba62-120d7ec4f1b0', 'Jorge', 'Baudino', 'Jorge Baudino', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bc7539e5-714d-51da-9c89-3bb7819d6741', 'Oscar', 'Svriz', 'Oscar Svriz', '663ea58f-35dd-57bb-92e8-846648259dba', 'Bariloche')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('2cd95549-da82-55fc-925b-8dd77b78decc', 'Hector', 'Pessoa', 'Hector Pessoa', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a71c3ee0-0a59-5a8f-83fa-74d64d6a165b', 'Eduardo', 'Pessoa', 'Eduardo Pessoa', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('d563f98e-7145-56c7-9f4d-ce3b28852f4f', 'Hugo', 'Nardini', 'Hugo Nardini', '0c6879d1-a9f8-511e-a48a-11f2f9cd8d2e', 'Villa Regina')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('7dc98507-60a2-59a4-8032-a7de3bf3f697', 'Andres', 'Janavel', 'Andres Janavel', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('ccb84568-60c5-58b4-9f64-9b18ce31990f', 'Oscar', 'Gauna', 'Oscar Gauna', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('83a4809d-0709-526f-858f-c73814835191', null, 'Santa Cruz', 'Santa Cruz', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('c592edd1-a131-50bc-9b13-4c9f33236e17', 'Pablo', 'Alvarez', 'Pablo Alvarez', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('1fc75aea-46f0-5f91-9dcc-405b0710c00b', 'Manuel', 'Victoria', 'Manuel Victoria', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('40b0a4aa-dd7c-589d-88b7-297248fad05e', 'Jorge', 'Ribaya', 'Jorge Ribaya', 'e01cade7-1342-5a0c-8b6d-65f3cc571de1', 'Pto.deseado')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('0d3b833c-6d97-580e-88eb-dd958ca72978', 'Roberto', 'Valdez', 'Roberto Valdez', 'ecde37e1-2a5e-55e2-b2f9-f08aec9496dd', 'Plottier')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('360da39c-b11a-5ec4-b47b-4478c9a710fc', 'Luis', 'Sastre', 'Luis Sastre', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('f9478cea-84f8-595b-b972-ab2fad092234', 'Alberto', 'Tontikian', 'Alberto Tontikian', '3a783fbf-3248-584d-baf5-5032b0d32fc4', 'Mdq')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('3b0098a7-d223-5843-a7d6-d7b2d87397ea', 'Oscar', 'Fernandez', 'Oscar Fernandez', '5cbbb1f7-72b9-5e94-9c10-0752f23e70af', 'Cipolletti')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('757af3a3-44eb-513a-9f75-8fb9226f02b9', null, 'Frumboli', 'Frumboli', 'acc21ae6-2da9-5477-846d-703103d7a12b', 'Neuquen')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('bd6f44ab-d35e-53b5-8dc8-0fac099d3a3e', 'Rene', 'Galindez', 'Rene Galindez', '3c43b215-6772-53f6-9d77-21a8c518b96a', 'Esquel')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('8fe05913-9d73-5be7-857e-81b79fc3c65f', 'Omar', 'Benitez', 'Omar Benitez', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('216efeb0-9c0b-5423-805c-bd8682834b30', 'Jorge', 'Lemoine', 'Jorge Lemoine', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('96a5e61d-3f8d-56b5-9fbf-5bd2402b8d79', 'Hector', 'Celedonio', 'Hector Celedonio', '157b8d09-8010-5afa-8280-a7214b68dd11', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a4915957-f5ba-5861-8211-f898f299250d', 'Oscar', 'Loperena', 'Oscar Loperena', '157b8d09-8010-5afa-8280-a7214b68dd11', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('a2d85a67-8d3c-501e-8485-777ea3e36a41', 'Palito', 'Gomez', 'Palito Gomez', 'b28925ca-6f09-5b5d-8249-a03a7da371a8', 'Rawson')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('88d92710-7256-53f8-90d2-d9399bad42bd', 'Miguel', 'Feu', 'Miguel Feu', '29229320-eec6-5b2e-93f1-132d096c80ac', 'Trelew')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('32905437-e131-50d1-8789-5d24a6f4c37d', 'Oscar', 'Bernardi', 'Oscar Bernardi', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('e3cd9feb-dbaf-56f4-8dd7-8a3caa7b7063', 'Jorge', 'Martinez', 'Jorge Martinez', '9962c787-bf4d-5f7f-ada8-1916c50d52e0', 'La Plata')
  on conflict (id) do nothing;
insert into players (id, first_name, last_name, display_name, club_id, city) values ('64b3cb9e-e7c9-5fd7-9bc7-63cd9ffd1e48', null, 'Elorza', 'Elorza', 'b3409c1f-82d9-54b4-9654-0c62db1e48be', 'La Pampa')
  on conflict (id) do nothing;

-- eventos de ranking: puntaje historico por (jugador, categoria, sede).
-- event_type='historico_importado' porque el desglose por instancia
-- (campeon/semifinal/...) no esta confirmado con el organizador todavia
-- (ver pendiente #1 en docs/FASE-0-AUDITORIA.md). source_key garantiza
-- que re-correr este seed no duplique puntos.
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2bda21ef-48c2-5442-b2dc-b5e797738477', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:LOZANO:JOSE LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2bda21ef-48c2-5442-b2dc-b5e797738477', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:LOZANO:JOSE LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2bda21ef-48c2-5442-b2dc-b5e797738477', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:LOZANO:JOSE LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2bda21ef-48c2-5442-b2dc-b5e797738477', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:LOZANO:JOSE LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('806e94ed-1994-5349-9abb-34c9209ac061', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:ARAYA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('806e94ed-1994-5349-9abb-34c9209ac061', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:ARAYA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('806e94ed-1994-5349-9abb-34c9209ac061', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:ARAYA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a52d024a-d0d1-58ea-bab7-fb7e8f9102f9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:DE URIARTE:FRANCISCO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a52d024a-d0d1-58ea-bab7-fb7e8f9102f9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:DE URIARTE:FRANCISCO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a52d024a-d0d1-58ea-bab7-fb7e8f9102f9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:DE URIARTE:FRANCISCO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a52d024a-d0d1-58ea-bab7-fb7e8f9102f9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:DE URIARTE:FRANCISCO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('38c2b574-c161-5eb1-acbd-5ca4367f7e1a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:BAZTAN:JUAN PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('38c2b574-c161-5eb1-acbd-5ca4367f7e1a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:BAZTAN:JUAN PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e55b621d-0c7b-5657-b323-8598c1704718', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:GIL:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e55b621d-0c7b-5657-b323-8598c1704718', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GIL:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e55b621d-0c7b-5657-b323-8598c1704718', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:GIL:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6ce9a5cc-78af-568c-bf67-7975ea3500ff', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:MENDEZ:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6ce9a5cc-78af-568c-bf67-7975ea3500ff', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:MENDEZ:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6ce9a5cc-78af-568c-bf67-7975ea3500ff', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:MENDEZ:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6ce9a5cc-78af-568c-bf67-7975ea3500ff', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:MENDEZ:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('675f176e-51b6-5f37-acc6-efa3c09039a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:COPPIS:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('675f176e-51b6-5f37-acc6-efa3c09039a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:COPPIS:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('675f176e-51b6-5f37-acc6-efa3c09039a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:COPPIS:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('af69fdcf-5684-563e-8848-3633439ec0b7', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:VIGHETO:JAVIER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1476573d-e18a-5563-a9da-dcd487e2c965', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:MARRERO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('357e0756-8164-5fef-be47-d41fa2d5b3ed', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:SANCHEZ:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('357e0756-8164-5fef-be47-d41fa2d5b3ed', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:SANCHEZ:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('357e0756-8164-5fef-be47-d41fa2d5b3ed', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:SANCHEZ:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb21a8e4-42d4-533d-a6bb-2902ff2a53b5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:LUCERO:OSVALDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb21a8e4-42d4-533d-a6bb-2902ff2a53b5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:LUCERO:OSVALDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8d9f2cd3-2acd-554c-8c91-b9e947469a81', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:NUTRICHI:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8d9f2cd3-2acd-554c-8c91-b9e947469a81', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:NUTRICHI:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('797ab56a-f044-5b71-b3f7-6dfc1fb6faf6', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:RODRIGUEZ:GASTON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('797ab56a-f044-5b71-b3f7-6dfc1fb6faf6', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:RODRIGUEZ:GASTON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('797ab56a-f044-5b71-b3f7-6dfc1fb6faf6', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:RODRIGUEZ:GASTON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('db347aa0-8f2f-5ef8-9dad-9c2e39e8263d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:ARRECHEA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('db347aa0-8f2f-5ef8-9dad-9c2e39e8263d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:ARRECHEA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('04d42582-3198-52ba-9d0d-db4c21dc25e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:DANUNCIO:JONATAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('04d42582-3198-52ba-9d0d-db4c21dc25e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:DANUNCIO:JONATAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4945c853-f343-5ce9-b3d1-6635a65582b0', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:LOMBARDI:JAVIER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e89d37c3-b18d-5521-acfb-910002e5c679', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:ATTENDEMI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e89d37c3-b18d-5521-acfb-910002e5c679', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:ATTENDEMI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e89d37c3-b18d-5521-acfb-910002e5c679', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:ATTENDEMI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29eec4de-1b39-5c82-b83d-d874c3b6360c', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:ZAGARI:NICODEMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29eec4de-1b39-5c82-b83d-d874c3b6360c', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:ZAGARI:NICODEMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29eec4de-1b39-5c82-b83d-d874c3b6360c', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:ZAGARI:NICODEMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9fc9cb04-e62d-5053-9977-783339661ffd', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:MORON:MARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('409da0e2-201d-5c86-9924-033684685c75', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:OLIVELLA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9b56670e-4164-5462-9779-624467f4f4e7', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:CUESTA:MANUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c864d39d-287f-5a9e-9259-48759117d872', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:FRABIANI::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('09fd5248-9364-5a1e-8eed-f2654c835bcc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:GARCIA:DINO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('09fd5248-9364-5a1e-8eed-f2654c835bcc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GARCIA:DINO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('09fd5248-9364-5a1e-8eed-f2654c835bcc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:GARCIA:DINO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('09fd5248-9364-5a1e-8eed-f2654c835bcc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:GARCIA:DINO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c550e978-8416-5dac-8dd6-369d7bf2e8cd', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:MEDINA:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('afcc6d27-8aa0-5b1b-9fc8-394596ef7978', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:SALAS:MARIANO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9593d33c-ff05-52ca-bbc4-8bc8415a9bcb', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GARMENDIA:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9593d33c-ff05-52ca-bbc4-8bc8415a9bcb', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:GARMENDIA:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9593d33c-ff05-52ca-bbc4-8bc8415a9bcb', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:GARMENDIA:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6e6cc171-a6cf-58a9-8f73-d6f76e74edbf', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:RETAMAL:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6e6cc171-a6cf-58a9-8f73-d6f76e74edbf', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:RETAMAL:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6e6cc171-a6cf-58a9-8f73-d6f76e74edbf', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:RETAMAL:ALEJANDRO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98e8627b-8755-5a7e-9399-8fd6ed96a96d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:FREIBERGER:MAURICIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98e8627b-8755-5a7e-9399-8fd6ed96a96d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:FREIBERGER:MAURICIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98e8627b-8755-5a7e-9399-8fd6ed96a96d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:FREIBERGER:MAURICIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98e8627b-8755-5a7e-9399-8fd6ed96a96d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:FREIBERGER:MAURICIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a2994e88-ad8a-5a78-9c98-fbff8e087277', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:MORALES:ISMAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a2994e88-ad8a-5a78-9c98-fbff8e087277', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:MORALES:ISMAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a2994e88-ad8a-5a78-9c98-fbff8e087277', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:MORALES:ISMAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc558ba7-d0f0-5f11-94f7-e026fac70727', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:GAVIGLIA:GUILLERMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc558ba7-d0f0-5f11-94f7-e026fac70727', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GAVIGLIA:GUILLERMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc558ba7-d0f0-5f11-94f7-e026fac70727', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:GAVIGLIA:GUILLERMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87505a2-975a-5572-8003-f8a8c492c9e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:GUZMAN:MARTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87505a2-975a-5572-8003-f8a8c492c9e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GUZMAN:MARTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87505a2-975a-5572-8003-f8a8c492c9e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:GUZMAN:MARTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2c676921-0523-5cfa-81f5-e67142b7846a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:50:Esquel:GABIS:MARCELO:AOSC.ESPANOLA NQN|NEUQUEN')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2c676921-0523-5cfa-81f5-e67142b7846a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:GABIS:MARCELO:AOSC.ESPANOLA NQN|NEUQUEN')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a6c82ff4-09b2-5535-a8a7-892bfd8acb6d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:LECOT:JAVIER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('31f05041-f995-502e-8ecf-b168fb234396', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:LOPEZ:GUILLERMO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f8ed487d-0b2c-599f-a5c4-5c9ea9b285f1', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:CODERMATZ:DINO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7bfbb151-2812-5ce9-8a4b-3d32f623ed84', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:RIQUELME:CLAUDIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('58c7d093-6fd7-5a27-a425-b7b9729850a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:AREVALO:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('53c2fc8e-cdfe-53f9-8254-7d5a44f74bef', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:HERNANDEZ::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('18e3b7c7-55d3-594e-8299-1783d4b8f434', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:50:Cipolletti:ALCANTAR:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f5654d4a-432a-52fd-b680-c9ac79968f8e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:LINARES:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0beac85a-ba8b-55f5-b5fd-8a41064a03be', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:AROCENA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2b603172-e743-50c8-9f2a-17d548d64906', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:50:Union Vasca:HERNANDO:VIVIANO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b4bb2800-a910-5608-99c0-b888b903fa07', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:SALAMIDA:MARCOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('34109b6e-7e14-5a7a-aaf4-7c35666867a1', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:MORENO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a5b5e9a0-6d47-5db4-8100-89952fa96409', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:SACHETTI:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('77d11f53-cd5c-50c5-b733-18c6e2109a3a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'dccdeda1-d022-5c73-b56a-bb8edc6cf31c', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:50:Rawson:AGUILAR:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('00aa42a3-b564-5acb-bd61-174654ad10f8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:JONES:RAFAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('00aa42a3-b564-5acb-bd61-174654ad10f8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:JONES:RAFAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('00aa42a3-b564-5acb-bd61-174654ad10f8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:JONES:RAFAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('00aa42a3-b564-5acb-bd61-174654ad10f8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:JONES:RAFAEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e570eac4-8db2-555b-bad0-8192e3252fbb', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:PAINENAU:ALFONSO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e570eac4-8db2-555b-bad0-8192e3252fbb', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:PAINENAU:ALFONSO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e570eac4-8db2-555b-bad0-8192e3252fbb', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:PAINENAU:ALFONSO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('21ec880c-8d76-5600-914e-50ab47e116f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:REZZONICO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('21ec880c-8d76-5600-914e-50ab47e116f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:REZZONICO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('21ec880c-8d76-5600-914e-50ab47e116f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:REZZONICO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('21ec880c-8d76-5600-914e-50ab47e116f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:REZZONICO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a484c2c3-8096-5094-9d80-af8df8be8bec', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:RAMOS:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a484c2c3-8096-5094-9d80-af8df8be8bec', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:RAMOS:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a484c2c3-8096-5094-9d80-af8df8be8bec', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:RAMOS:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f64ee520-7361-53e3-bd54-d56069d1e9e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ROYO:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f64ee520-7361-53e3-bd54-d56069d1e9e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ROYO:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f64ee520-7361-53e3-bd54-d56069d1e9e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:ROYO:SILVIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1ca069e4-f5b1-5885-a0ba-3e80124f176e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:BENVENUTTO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1ca069e4-f5b1-5885-a0ba-3e80124f176e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:BENVENUTTO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1ca069e4-f5b1-5885-a0ba-3e80124f176e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:BENVENUTTO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1ca069e4-f5b1-5885-a0ba-3e80124f176e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:BENVENUTTO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6fb42a9f-4893-543e-ae6d-278b2e94f882', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:LARA:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6fb42a9f-4893-543e-ae6d-278b2e94f882', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:LARA:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('6fb42a9f-4893-543e-ae6d-278b2e94f882', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:LARA:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96e76add-4b4b-5bc1-bc0a-718907f1e0c8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:MAYORGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96e76add-4b4b-5bc1-bc0a-718907f1e0c8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:MAYORGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96e76add-4b4b-5bc1-bc0a-718907f1e0c8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:MAYORGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('598cc4f3-6722-574b-a522-4e56a915c4e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:SARCHIONI:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('598cc4f3-6722-574b-a522-4e56a915c4e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:SARCHIONI:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('598cc4f3-6722-574b-a522-4e56a915c4e5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:SARCHIONI:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('673eea1c-268c-5fdd-a76f-0b7f32ec6409', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ABADIE:ALBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('673eea1c-268c-5fdd-a76f-0b7f32ec6409', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ABADIE:ALBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('673eea1c-268c-5fdd-a76f-0b7f32ec6409', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:ABADIE:ALBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('089ab061-cc19-5adb-9a6e-a43e5dc0847c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ACUNA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('089ab061-cc19-5adb-9a6e-a43e5dc0847c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ACUNA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('615d614d-0316-547e-b957-32d2dcf9bc37', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:DUBIE:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('615d614d-0316-547e-b957-32d2dcf9bc37', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:DUBIE:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('615d614d-0316-547e-b957-32d2dcf9bc37', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:DUBIE:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb2af2a8-358e-5ed7-9047-63c7995893e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:VIDAL:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb2af2a8-358e-5ed7-9047-63c7995893e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:VIDAL:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb2af2a8-358e-5ed7-9047-63c7995893e1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:VIDAL:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('313f6904-c019-59a8-903b-554430cb82cd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:GILARDONI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('313f6904-c019-59a8-903b-554430cb82cd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:GILARDONI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('313f6904-c019-59a8-903b-554430cb82cd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:GILARDONI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('600e6f7b-97e1-5bd4-8c2a-5ecd47600db6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:REAL:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('600e6f7b-97e1-5bd4-8c2a-5ecd47600db6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:REAL:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('600e6f7b-97e1-5bd4-8c2a-5ecd47600db6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:REAL:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a6c82ff4-09b2-5535-a8a7-892bfd8acb6d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:LECOT:JAVIER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f8c6d56d-9cec-5cbf-9e6b-7fd8905f91cd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:SALAMIDA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3539fb6d-5c2f-58bc-9b8c-fbcc4579d20f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:CASTRO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b3f92d62-0a3b-54d9-982e-4ee5672eb4df', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:FRANZONI:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ea4ce6ff-3aa5-543d-ba1a-91b2d5e3aa82', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:DE URIARTE:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0b41bb40-4420-5363-b8d2-91f198c4dd09', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ARRILLAGA:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1e16fac1-615f-52ee-a448-2c0b06d9e57c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:INGANI:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1e16fac1-615f-52ee-a448-2c0b06d9e57c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:INGANI:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1e16fac1-615f-52ee-a448-2c0b06d9e57c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:INGANI:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3f7c1cc1-482b-5e18-8949-24c05a8005ea', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:MAIDA:JUAN CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3f7c1cc1-482b-5e18-8949-24c05a8005ea', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:MAIDA:JUAN CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('71a531fc-6a38-57bd-80c5-8acc91b29791', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:SOLORZA:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('71a531fc-6a38-57bd-80c5-8acc91b29791', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:SOLORZA:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('71a531fc-6a38-57bd-80c5-8acc91b29791', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:SOLORZA:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('58c7d093-6fd7-5a27-a425-b7b9729850a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:AREVALO:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('58c7d093-6fd7-5a27-a425-b7b9729850a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:AREVALO:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('58c7d093-6fd7-5a27-a425-b7b9729850a9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:AREVALO:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9fc9cb04-e62d-5053-9977-783339661ffd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:MORON:MARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9fc9cb04-e62d-5053-9977-783339661ffd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:MORON:MARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9fc9cb04-e62d-5053-9977-783339661ffd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:MORON:MARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1476573d-e18a-5563-a9da-dcd487e2c965', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:MARRERO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1476573d-e18a-5563-a9da-dcd487e2c965', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:MARRERO:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8ee839c0-344e-5e30-9c1a-84a522be2130', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:IRALDE:SERGIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8ee839c0-344e-5e30-9c1a-84a522be2130', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:IRALDE:SERGIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8ee839c0-344e-5e30-9c1a-84a522be2130', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:IRALDE:SERGIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8ee839c0-344e-5e30-9c1a-84a522be2130', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:IRALDE:SERGIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ea016aea-0888-5f6f-9274-6c12851f4dee', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:REAL:TOMAS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ea016aea-0888-5f6f-9274-6c12851f4dee', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:REAL:TOMAS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f5654d4a-432a-52fd-b680-c9ac79968f8e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:LINARES:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f5654d4a-432a-52fd-b680-c9ac79968f8e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:LINARES:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fd09726b-7c72-5bfc-b2f3-6d336623c06e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:DE ORO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87fa3c9-edfa-53a3-ae76-e0424f7c529f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:FONSECA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('65120eae-e604-5012-ae18-b6d4984d8114', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:PALANDRI:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bde31fb5-f594-56d8-b51b-c28c81228674', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:BRAVO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bde31fb5-f594-56d8-b51b-c28c81228674', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:BRAVO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bde31fb5-f594-56d8-b51b-c28c81228674', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:BRAVO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('16be5bd6-8934-5e97-bcb0-3a3b78db6397', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:AGUILAR:SIMON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f0881692-13d2-549d-8658-f619aaa1a99d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:FRADEGAS:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f0881692-13d2-549d-8658-f619aaa1a99d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:FRADEGAS:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f0881692-13d2-549d-8658-f619aaa1a99d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:FRADEGAS:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('74117289-7108-54ed-812b-3973b206de8d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:MACEDO:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('74117289-7108-54ed-812b-3973b206de8d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:MACEDO:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('74117289-7108-54ed-812b-3973b206de8d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:MACEDO:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c0f4c98e-873e-593c-ae89-e0ab15c77bfc', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:TURBILLE:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c39f7824-6882-5d57-a048-2a1ad8d3803f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:LICCIARDI:FITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('28be597b-5ac4-5ecd-b25e-12697424c931', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:REZZONICO:JUAN CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('28be597b-5ac4-5ecd-b25e-12697424c931', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:REZZONICO:JUAN CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8563e980-7c64-5595-bddd-e061998858f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ARREDONDO:JUAN C:ALL BOYS|LA PAMPA')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8563e980-7c64-5595-bddd-e061998858f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ARREDONDO:JUAN C:ALL BOYS|LA PAMPA')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('87875cd9-ae33-5cdc-ba08-094fc19f9700', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ECHEVERS:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('87875cd9-ae33-5cdc-ba08-094fc19f9700', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:ECHEVERS:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('628b9d65-c887-55a6-b25e-fe99e64e225e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:PIROTTA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('628b9d65-c887-55a6-b25e-fe99e64e225e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:PIROTTA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9c8ac7eb-7c51-5785-85c2-667d46954470', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:CHIZZOLI:EDUARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9c8ac7eb-7c51-5785-85c2-667d46954470', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:CHIZZOLI:EDUARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a9577363-27f4-5432-95c8-14396ee10a01', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:ROSALES:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bf31adb3-0afd-592c-afdf-bb9f42c59ea5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:ORTIZ:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ee714212-c18c-506a-9ce3-e861feed3bd4', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:56:Esquel:MIGUEL:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c25d6371-550b-5dfd-ad7a-fe6b86f10c0e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:GREGOIDE:GABRIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9f65fb77-3dbe-58a2-a5eb-2a167fe24fcc', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:CONDE:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c4d1bd59-5182-50e6-8583-d45fd8f18360', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:ZAFAR:SELEME:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('31a78290-af09-519c-b89f-2b71b89c8788', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:56:Cipolletti:MUTTI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2ef3f6d8-1787-5511-af1f-39c992fe814c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:VENTIMIGLIA:FERNANDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f5cd29f5-3a16-5479-9b8b-2a6377b1a72d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:SANDI:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8a10664f-433f-56ae-a82d-d042ef439865', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:CARRO:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a42077f9-08ef-52c6-b313-529babad9575', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:DURANT:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2047a841-5f09-5530-b4ee-859c23dcd512', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:56:Union Vasca:GABIS:MARCELO:ASOC. ESPANOLA|NEUQUEN')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b61dcd48-bc78-541f-9dc7-588628c2d829', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:ORTEGA:LAZARO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d44472ab-430f-5236-ac26-88c3923c1bb5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '2c0c3f18-6c8c-5103-acbb-e45f0044e203', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:56:Rawson:AIZPURUA:EDUARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb9c881b-dce1-5f68-a4b6-2668bbdd5070', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:ZAPATA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb9c881b-dce1-5f68-a4b6-2668bbdd5070', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:ZAPATA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb9c881b-dce1-5f68-a4b6-2668bbdd5070', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:ZAPATA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('eb9c881b-dce1-5f68-a4b6-2668bbdd5070', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:ZAPATA:JOSE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb2ecc30-2c14-5bd8-b14d-0873754d2eb1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:PASTOR:WALTER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb2ecc30-2c14-5bd8-b14d-0873754d2eb1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:PASTOR:WALTER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb2ecc30-2c14-5bd8-b14d-0873754d2eb1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:PASTOR:WALTER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fb2ecc30-2c14-5bd8-b14d-0873754d2eb1', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:PASTOR:WALTER:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('89f2f84a-f883-548d-ba65-e07732acf7ab', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:PESSOA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('89f2f84a-f883-548d-ba65-e07732acf7ab', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:PESSOA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('89f2f84a-f883-548d-ba65-e07732acf7ab', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:PESSOA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('89f2f84a-f883-548d-ba65-e07732acf7ab', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:PESSOA:ADRIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc32cbd6-8b55-58a6-bbd5-fec5f0e7ae13', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:LARA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc32cbd6-8b55-58a6-bbd5-fec5f0e7ae13', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:LARA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('83d9135e-8652-5fb8-99a4-4fdd1c5ad031', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:DESUQUE:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('83d9135e-8652-5fb8-99a4-4fdd1c5ad031', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:DESUQUE:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7a6a827a-4405-561d-9a1c-1132e7f968c2', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:GEREZ:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7a6a827a-4405-561d-9a1c-1132e7f968c2', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:GEREZ:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7a6a827a-4405-561d-9a1c-1132e7f968c2', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:GEREZ:DANIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29a03ae2-0391-556b-8814-77b3c1730c3d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:LANATA:DARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29a03ae2-0391-556b-8814-77b3c1730c3d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:LANATA:DARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29a03ae2-0391-556b-8814-77b3c1730c3d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:LANATA:DARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('29a03ae2-0391-556b-8814-77b3c1730c3d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:LANATA:DARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('61d2e2c1-6bda-585a-b2b7-a5be459ffba9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:GARRIDO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('61d2e2c1-6bda-585a-b2b7-a5be459ffba9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:GARRIDO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('61d2e2c1-6bda-585a-b2b7-a5be459ffba9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:GARRIDO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('61d2e2c1-6bda-585a-b2b7-a5be459ffba9', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:GARRIDO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('07126796-e5ee-559b-900a-727653e87d9d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:SCATTINI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('07126796-e5ee-559b-900a-727653e87d9d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:SCATTINI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('07126796-e5ee-559b-900a-727653e87d9d', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:SCATTINI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c8dc54aa-ba84-5a53-b447-02369cc03d87', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:GARCIA:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c8dc54aa-ba84-5a53-b447-02369cc03d87', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:GARCIA:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('af2d1409-0a0c-5590-a546-f1be84fadd20', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:GONZALEZ:RAMON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('af2d1409-0a0c-5590-a546-f1be84fadd20', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:GONZALEZ:RAMON:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ee983186-6b9f-5cd3-af9e-7d425e2f1ada', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:QUIROGA:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ee983186-6b9f-5cd3-af9e-7d425e2f1ada', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:QUIROGA:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ee983186-6b9f-5cd3-af9e-7d425e2f1ada', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:QUIROGA:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('31a78290-af09-519c-b89f-2b71b89c8788', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:MUTTI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('46647976-9780-5cd8-a989-d03f7da9dd04', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:OBERLANDER:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('46647976-9780-5cd8-a989-d03f7da9dd04', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:OBERLANDER:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5a8e5d8c-3b9b-5464-a09a-60d850ca8a92', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:MANZANARES:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('01ade758-fa8a-54d0-a4f8-dcf4b6b77165', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:PEREZ:DAVID:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5af2e78b-d48b-519b-8900-5ef459f73fa5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:VIDELA:FERNANDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5af2e78b-d48b-519b-8900-5ef459f73fa5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:VIDELA:FERNANDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5af2e78b-d48b-519b-8900-5ef459f73fa5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:VIDELA:FERNANDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5af2e78b-d48b-519b-8900-5ef459f73fa5', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:VIDELA:FERNANDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('35e44ef4-87af-5dfa-936f-d4e7008d1783', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:CALDERERO:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('35e44ef4-87af-5dfa-936f-d4e7008d1783', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:CALDERERO:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2ae5702f-08bc-597d-baf5-2bb278cf5a5c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:SARDI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2ae5702f-08bc-597d-baf5-2bb278cf5a5c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:SARDI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2ae5702f-08bc-597d-baf5-2bb278cf5a5c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:SARDI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2ae5702f-08bc-597d-baf5-2bb278cf5a5c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:SARDI:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a729d1ea-0e5b-5532-b2b4-2793ebdf05dd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:DOMINGUEZ:ENRIQUE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a729d1ea-0e5b-5532-b2b4-2793ebdf05dd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:DOMINGUEZ:ENRIQUE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a729d1ea-0e5b-5532-b2b4-2793ebdf05dd', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:DOMINGUEZ:ENRIQUE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0d2cd468-f069-55c8-bfb1-9e6e45e7ccb7', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:HERAS:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0d2cd468-f069-55c8-bfb1-9e6e45e7ccb7', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:HERAS:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7e643b88-c887-506c-91e2-20fb9c3173cf', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:JECKEL:CESAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7e643b88-c887-506c-91e2-20fb9c3173cf', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:JECKEL:CESAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7e643b88-c887-506c-91e2-20fb9c3173cf', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:JECKEL:CESAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7e643b88-c887-506c-91e2-20fb9c3173cf', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:JECKEL:CESAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('37f4f8fb-3454-5763-88f2-612aca52d844', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:VALDEZ:ALFREDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('37f4f8fb-3454-5763-88f2-612aca52d844', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:VALDEZ:ALFREDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('37f4f8fb-3454-5763-88f2-612aca52d844', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:VALDEZ:ALFREDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('37f4f8fb-3454-5763-88f2-612aca52d844', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:VALDEZ:ALFREDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d47e6470-8143-5321-9709-dc606962718f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:BERNAL:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d47e6470-8143-5321-9709-dc606962718f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:BERNAL:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b7944c4c-9257-5e2a-adad-ec2bec24de15', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:RUDOLF:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0a78a15c-7c59-5e3f-ab03-54f667c81c51', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:FENIGER:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0a78a15c-7c59-5e3f-ab03-54f667c81c51', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:FENIGER:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0a78a15c-7c59-5e3f-ab03-54f667c81c51', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:FENIGER:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3d3fc59f-2686-5ae7-abc7-b1e360f80916', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:JAUREGUI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3d3fc59f-2686-5ae7-abc7-b1e360f80916', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:JAUREGUI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3d3fc59f-2686-5ae7-abc7-b1e360f80916', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:JAUREGUI:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87fa3c9-edfa-53a3-ae76-e0424f7c529f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:FONSECA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87fa3c9-edfa-53a3-ae76-e0424f7c529f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:FONSECA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e87fa3c9-edfa-53a3-ae76-e0424f7c529f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:FONSECA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98410190-d65c-58ab-bd11-7f76fec0f74c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:FERRE:JOSE MARIA:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98410190-d65c-58ab-bd11-7f76fec0f74c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:FERRE:JOSE MARIA:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('98410190-d65c-58ab-bd11-7f76fec0f74c', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:FERRE:JOSE MARIA:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3ebf1bde-be8b-579d-9a5a-ed6fe305620b', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 30, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:LARRANAGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3ebf1bde-be8b-579d-9a5a-ed6fe305620b', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:LARRANAGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3ebf1bde-be8b-579d-9a5a-ed6fe305620b', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:LARRANAGA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a66b9bac-881e-5a9b-b843-f8991c444140', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:JEREZ:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a66b9bac-881e-5a9b-b843-f8991c444140', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 30, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:JEREZ:DARIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f557bedd-f20c-5faf-b07c-90944214d3a8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:DIAZ:ELADIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f557bedd-f20c-5faf-b07c-90944214d3a8', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:DIAZ:ELADIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4093ccab-4da2-5945-856d-4989500bc08f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:ORDINES:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4093ccab-4da2-5945-856d-4989500bc08f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:ORDINES:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4093ccab-4da2-5945-856d-4989500bc08f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:ORDINES:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('71a531fc-6a38-57bd-80c5-8acc91b29791', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 30, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:SOLORZA:GERARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bdb5f4e7-7710-5552-9e09-8ab532c321b4', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:BAHAMONDE:HUMBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bdb5f4e7-7710-5552-9e09-8ab532c321b4', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:BAHAMONDE:HUMBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3a4e231c-2056-5254-9b4f-36cfdadba051', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:ZAPIOLA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0c986f1b-eca7-55d2-bb6a-806354c8a57e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61A:Esquel:FERNANDEZ:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bcec2433-1d3a-5e5c-9844-bfa520f90874', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:DURAN:FABIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9eeb5efa-6478-543b-8139-5d5f9d9fa762', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:TENCHINI:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('da091f39-50ed-5628-af79-1b491b4b131a', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:ROCHET:JULIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('fd09726b-7c72-5bfc-b2f3-6d336623c06e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:DE ORO:RICARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('47a5f8d6-4ad2-58b5-95c7-47e09cf3890f', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:MAIDA:LEONARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a0057ec2-a341-5e92-823f-d5829adc6700', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:SANDANELLA:EDGARD:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2b876769-6144-5c69-adca-96120c0bb49e', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61A:Cipolletti:CIMADEVILLA:GUSTAVO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('265fd5d3-0081-5092-b78f-0f0c4a973675', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:61A:Union Vasca:TORANZO:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('65120eae-e604-5012-ae18-b6d4984d8114', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:PALANDRI:MARCELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('20d98a81-8a64-5d2b-9aaf-1b86c989af13', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:LISTA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b33a5f7e-642b-534a-b544-25332eab66f6', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:ALARCON:NESTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('9f5799fe-659b-5cfa-a709-c86948598803', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:ARREDONDO:JUAN C:NAHUEL HUAPI|BARILOCHE')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0207f013-f274-5c74-b220-7057d1d5755a', '50a63259-87bf-53f1-9550-5eae1fe9788d', '108bc169-5500-59e5-9b11-22db6844c07f', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61A:Rawson:LOPEZ:CAMILO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('05c71a86-b43b-531b-9feb-bb3bd23d06f3', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:PEREZ:HIPOLITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('05c71a86-b43b-531b-9feb-bb3bd23d06f3', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:PEREZ:HIPOLITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('05c71a86-b43b-531b-9feb-bb3bd23d06f3', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:PEREZ:HIPOLITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('05c71a86-b43b-531b-9feb-bb3bd23d06f3', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:PEREZ:HIPOLITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d2a8389e-8015-5888-9dfe-65e44911ee08', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:VIDAL:EDGARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d2a8389e-8015-5888-9dfe-65e44911ee08', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:VIDAL:EDGARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d2a8389e-8015-5888-9dfe-65e44911ee08', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:VIDAL:EDGARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d2a8389e-8015-5888-9dfe-65e44911ee08', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:VIDAL:EDGARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5301051f-b99a-5090-a4b6-cfcf046dc320', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:ROMERO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5301051f-b99a-5090-a4b6-cfcf046dc320', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:ROMERO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('5301051f-b99a-5090-a4b6-cfcf046dc320', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:ROMERO:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b7e840e4-d2a2-5705-967c-ff686fc6ed93', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:IBARZABAL:RAUL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b7e840e4-d2a2-5705-967c-ff686fc6ed93', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:IBARZABAL:RAUL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b7e840e4-d2a2-5705-967c-ff686fc6ed93', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:IBARZABAL:RAUL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('14278f81-eb66-5596-a6be-9776fbec5587', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:CARRERAS:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('14278f81-eb66-5596-a6be-9776fbec5587', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:CARRERAS:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a51a688e-6f58-5352-8fc8-3388bf2203de', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:VARGAS:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a51a688e-6f58-5352-8fc8-3388bf2203de', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:VARGAS:JUAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96959350-fd82-53ad-859e-2e47fccc62ba', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:SILVA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96959350-fd82-53ad-859e-2e47fccc62ba', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:SILVA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96959350-fd82-53ad-859e-2e47fccc62ba', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:SILVA:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1300605e-fd41-5cf2-bc4e-b938857d2e55', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:LANUSSE:AGUSTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1300605e-fd41-5cf2-bc4e-b938857d2e55', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:LANUSSE:AGUSTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1300605e-fd41-5cf2-bc4e-b938857d2e55', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:LANUSSE:AGUSTIN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a34ab38d-23ba-5b6e-9e0c-2088c3bbbb8c', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:LLOYD:ARIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a34ab38d-23ba-5b6e-9e0c-2088c3bbbb8c', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:LLOYD:ARIEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('02dfe66d-351f-5280-be84-7345f018fc26', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:WILLIANS:KENY:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('02dfe66d-351f-5280-be84-7345f018fc26', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:WILLIANS:KENY:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1cd779d8-98f9-5a03-9c6b-0af91479e626', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:DE LOS SANTOS:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f4fa4098-35b9-57bf-92b4-cd535cd47be0', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:PICABEA;::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7d739440-4425-5ef2-8845-bbf1fb6ed233', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:FERRARI:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7d739440-4425-5ef2-8845-bbf1fb6ed233', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:FERRARI:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('00bddf1c-1b64-54b1-a1c7-20343ba54c5a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:DETTLER:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0e953993-9e65-53e3-a20d-e709c02003a8', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:TOTIKIAN:ALBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d0cda343-813e-5185-a773-ca25086dc825', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:BARAU:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0c266d1f-c3c9-5fee-8bfb-f6a832069f7b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:PASERO:ANTONIO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8abc2ca1-9cb4-58fd-915f-42cad573eec9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:61B:Union Vasca:CRESPI:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('cf083128-de8c-5d70-aeaa-2b515d6ebb27', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:ORDINEZ:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d515b6a2-3a97-575f-8b92-a4bc9b5a5538', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:OLIVER:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('20d98a81-8a64-5d2b-9aaf-1b86c989af13', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:LISTA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('20d98a81-8a64-5d2b-9aaf-1b86c989af13', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:LISTA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0207f013-f274-5c74-b220-7057d1d5755a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:LOPEZ:CAMILO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0207f013-f274-5c74-b220-7057d1d5755a', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:LOPEZ:CAMILO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b38cb78b-b64b-5cf5-860a-c0830c21d80b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:PUGLISI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b38cb78b-b64b-5cf5-860a-c0830c21d80b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:PUGLISI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b713de84-2447-5aea-9f91-af37040f090b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:FRUMBOLI:MARIANO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b713de84-2447-5aea-9f91-af37040f090b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:FRUMBOLI:MARIANO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4eb8b35c-f46c-55f3-b5fb-0ec621b3c92e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:O''LERY:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4eb8b35c-f46c-55f3-b5fb-0ec621b3c92e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:O''LERY:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('b713de84-2447-5aea-9f91-af37040f090b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:61B:Esquel:FRUMBOLI:MARIANO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7cf4d2e8-a0b8-59f1-8ade-4f3a3f6f7c59', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:ROMAN:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3a4e231c-2056-5254-9b4f-36cfdadba051', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:ZAPIOLA:CARLOS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3b27151e-ec5c-5007-9af2-533795be8447', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:OCHOA:JULIAN:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('4514ce8b-86cb-5f32-a494-54bffed341ca', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:PELLERETTI:CARMELO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8a99097e-21d8-57b7-ba62-120d7ec4f1b0', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:61B:Cipolletti:BAUDINO:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bc7539e5-714d-51da-9c89-3bb7819d6741', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:SVRIZ:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('2cd95549-da82-55fc-925b-8dd77b78decc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:PESSOA:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a71c3ee0-0a59-5a8f-83fa-74d64d6a165b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:PESSOA:EDUARDO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d563f98e-7145-56c7-9f4d-ce3b28852f4f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'ec1959a8-f474-56d3-9504-8c5c7d6939a5', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:61B:Rawson:NARDINI:HUGO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7dc98507-60a2-59a4-8032-a7de3bf3f697', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:JANAVEL:ANDRES:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7dc98507-60a2-59a4-8032-a7de3bf3f697', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:JANAVEL:ANDRES:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('7dc98507-60a2-59a4-8032-a7de3bf3f697', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:JANAVEL:ANDRES:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ccb84568-60c5-58b4-9f64-9b18ce31990f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:GAUNA:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ccb84568-60c5-58b4-9f64-9b18ce31990f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:GAUNA:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ccb84568-60c5-58b4-9f64-9b18ce31990f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:GAUNA:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('ccb84568-60c5-58b4-9f64-9b18ce31990f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:GAUNA:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('83a4809d-0709-526f-858f-c73814835191', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:SANTA CRUZ::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('83a4809d-0709-526f-858f-c73814835191', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:SANTA CRUZ::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('83a4809d-0709-526f-858f-c73814835191', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:SANTA CRUZ::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c592edd1-a131-50bc-9b13-4c9f33236e17', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 80, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:ALVAREZ:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c592edd1-a131-50bc-9b13-4c9f33236e17', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 60, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:ALVAREZ:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('c592edd1-a131-50bc-9b13-4c9f33236e17', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 100, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:ALVAREZ:PABLO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1fc75aea-46f0-5f91-9dcc-405b0710c00b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 100, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:VICTORIA:MANUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('1fc75aea-46f0-5f91-9dcc-405b0710c00b', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 120, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:VICTORIA:MANUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('40b0a4aa-dd7c-589d-88b7-297248fad05e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:RIBAYA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('40b0a4aa-dd7c-589d-88b7-297248fad05e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:RIBAYA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('40b0a4aa-dd7c-589d-88b7-297248fad05e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:RIBAYA:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0d3b833c-6d97-580e-88eb-dd958ca72978', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:VALDEZ:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0d3b833c-6d97-580e-88eb-dd958ca72978', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 80, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:VALDEZ:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('0d3b833c-6d97-580e-88eb-dd958ca72978', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:VALDEZ:ROBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('360da39c-b11a-5ec4-b47b-4478c9a710fc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:SASTRE:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('360da39c-b11a-5ec4-b47b-4478c9a710fc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 60, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:SASTRE:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('360da39c-b11a-5ec4-b47b-4478c9a710fc', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 60, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:SASTRE:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('d0cda343-813e-5185-a773-ca25086dc825', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:BARAU:LUIS:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('f9478cea-84f8-595b-b972-ab2fad092234', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 120, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:TONTIKIAN:ALBERTO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('3b0098a7-d223-5843-a7d6-d7b2d87397ea', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 120, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:FERNANDEZ:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('757af3a3-44eb-513a-9f75-8fb9226f02b9', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 120, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:FRUMBOLI::')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('bd6f44ab-d35e-53b5-8dc8-0fac099d3a3e', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 100, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:GALINDEZ:RENE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('8fe05913-9d73-5be7-857e-81b79fc3c65f', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:BENITEZ:OMAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('216efeb0-9c0b-5423-805c-bd8682834b30', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 100, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:LEMOINE:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('96a5e61d-3f8d-56b5-9fbf-5bd2402b8d79', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:CELEDONIO:HECTOR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a4915957-f5ba-5861-8211-f898f299250d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 80, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:LOPERENA:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('a2d85a67-8d3c-501e-8485-777ea3e36a41', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 80, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:GOMEZ:PALITO:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('88d92710-7256-53f8-90d2-d9399bad42bd', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 60, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:FEU:MIGUEL:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('32905437-e131-50d1-8789-5d24a6f4c37d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '3b9a9850-61ba-509b-8559-d5c31295f1a8', 'historico_importado', 10, 'Importado de planilla historica - Cipolletti', 'hist:2025:65:Cipolletti:BERNARDI:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('32905437-e131-50d1-8789-5d24a6f4c37d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:BERNARDI:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('32905437-e131-50d1-8789-5d24a6f4c37d', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', 'c4bdfd09-cfb7-5c20-8571-399832a9a78b', 'historico_importado', 10, 'Importado de planilla historica - Rawson', 'hist:2025:65:Rawson:BERNARDI:OSCAR:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('e3cd9feb-dbaf-56f4-8dd7-8a3caa7b7063', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '17b55347-3c5d-54ff-8f79-cd2a5cfb7885', 'historico_importado', 10, 'Importado de planilla historica - Esquel', 'hist:2025:65:Esquel:MARTINEZ:JORGE:')
  on conflict (source_key) do nothing;
insert into ranking_events (player_id, season_id, category_id, tournament_id, event_type, points, description, source_key) values ('64b3cb9e-e7c9-5fd7-9bc7-63cd9ffd1e48', '50a63259-87bf-53f1-9550-5eae1fe9788d', 'e0678232-cc67-5243-bcc0-17dea889a221', '5d2c0a6c-461e-57ad-a9de-ce0962b90b36', 'historico_importado', 10, 'Importado de planilla historica - Union Vasca', 'hist:2025:65:Union Vasca:ELORZA::')
  on conflict (source_key) do nothing;
