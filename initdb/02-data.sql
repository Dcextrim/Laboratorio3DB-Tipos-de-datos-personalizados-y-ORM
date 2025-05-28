-- ============================================================
-- Laboratorio 3 - Base de Datos 1
-- Dulce Ambrosio - 231143
-- Daniel Chet - 231177
-- ============================================================

-- ---------------------------
-- 1. Tabla cliente
-- ---------------------------

INSERT INTO cliente (nombre_cliente, correo, telefono, direccion) VALUES
('Joannes Worlock', 'joannes.worlock@yahoo.fr', '(202) 219-1866', '14384 Wentworth Lane, Washington, District of Columbia, United States, 20508'),
('Izzy Heffy', 'izzy.heffy@yahoo.com', '(502) 647-8773', '13833 Marrot Terrace, Louisville, Kentucky, United States, 40256'),
('Jenifer Koeppe', 'jenifer.koeppe@yahoo.com', '(413) 993-7228', '9916 Silverstreet Way, Springfield, Massachusetts, United States, 01152'),
('Hector Sinnie', 'hector.sinnie@hotmail.com', '(941) 310-6283', '3739 Jardin Court, Sarasota, Florida, United States, 34238'),
('Allina Scotchmore', 'allina.scotchmore@gmail.com', '(626) 628-5288', '2800 Jodphur Lane, Pasadena, California, United States, 91131'),
('Terri Comben', 'terri.comben@aol.com', '(901) 292-9311', '3298 Chantel Court, Memphis, Tennessee, United States, 38161'),
('Dav Jewel', 'dav.jewel@orange.fr', '(469) 601-3552', '8881 Gresham Avenue, Dallas, Texas, United States, 75287'),
('Valina Speek', 'valina.speek@t-online.de', '(850) 563-9507', '1999 Isabella Avenue, Pensacola, Florida, United States, 32590'),
('Judd Brotherhed', 'judd.brotherhed@hotmail.fr', '(904) 021-5046', '13162 Castlewood Lane, Jacksonville, Florida, United States, 32236'),
('Ted Diffley', 'ted.diffley@gmail.com', '(214) 482-6041', '9729 Duncan Drive, Dallas, Texas, United States, 75265'),
('Susann Gellan', 'susann.gellan@hotmail.com', '(619) 920-9313', '12568 Lajolla Circle, San Diego, California, United States, 92121'),
('Berni Ducarne', 'berni.ducarne@yahoo.co.in', '(610) 676-7223', '4712 Sander Street, Allentown, Pennsylvania, United States, 18105'),
('Regina Colville', 'regina.colville@hotmail.fr', '(702) 485-2091', '10843 Winchester Court, Las Vegas, Nevada, United States, 89193'),
('Matelda Fetterplace', 'matelda.fetterplace@aol.com', '(208) 553-8616', '14917 Lajolla Circle, Idaho Falls, Idaho, United States, 83405'),
('Kaila Storres', 'kaila.storres@hotmail.com', '(512) 761-8683', '6947 Marnie Terrace, Austin, Texas, United States, 78732'),
('Demott Lefeuvre', 'demott.lefeuvre@gmail.com', '(901) 170-8962', '495 Fletcher Lane, Memphis, Tennessee, United States, 38114'),
('Elsa Bielefeld', 'elsa.bielefeld@mail.ru', '(510) 831-5677', '9427 Tate Terrace, Richmond, California, United States, 94807'),
('Mac MacParlan', 'mac.macparlan@yahoo.com', '(704) 059-0630', '4661 Oleander Street, Charlotte, North Carolina, United States, 28247'),
('Eulalie Byforth', 'eulalie.byforth@wanadoo.fr', '(559) 897-6671', '7123 Bainan Place, Fresno, California, United States, 93721'),
('Abbe Bodesson', 'abbe.bodesson@yahoo.com', '(304) 948-3183', '9198 Fosgate Place, Huntington, West Virginia, United States, 25726'),
('Ora Griswaite', 'ora.griswaite@hotmail.com', '(617) 427-6782', '2216 Ramsell Road, Waltham, Massachusetts, United States, 02453'),
('Walther Pimblotte', 'walther.pimblotte@yahoo.com', '(717) 939-5518', '7934 Lynchburg Loop, Harrisburg, Pennsylvania, United States, 17105'),
('Carmelita Cortin', 'carmelita.cortin@hotmail.co.uk', '(661) 317-7378', '9438 Montbrook Place, Lancaster, California, United States, 93584'),
('Alejandrina Charlwood', 'alejandrina.charlwood@yahoo.com', '(215) 451-3306', '2756 Cheryl Court, Philadelphia, Pennsylvania, United States, 19184'),
('Yorke Spinige', 'yorke.spinige@yandex.ru', '(559) 285-8510', '13987 Ritch Road, Fresno, California, United States, 93726'),
('Hannis Bend', 'hannis.bend@yahoo.com', '(772) 598-9124', '10389 Melle Place, Vero Beach, Florida, United States, 32969'),
('Wenona Pentecust', 'wenona.pentecust@yahoo.com', '(512) 219-5875', '14838 Malone Circle, Austin, Texas, United States, 78715'),
('Towny Bullard', 'towny.bullard@yahoo.com', '(626) 489-9251', '4534 Niblick Court, Pasadena, California, United States, 91186'),
('Terrell Bendell', 'terrell.bendell@gmail.com', '(510) 727-6072', '13968 Nackman Place, Oakland, California, United States, 94622'),
('Eli Went', 'eli.went@gmail.com', '(817) 713-7006', '4390 Hutcheson Way, Arlington, Texas, United States, 76004');

-- ---------------------------
-- 2. Tabla detalle_renta
-- ---------------------------
ALTER SEQUENCE detalle_renta_id_detallerenta_seq RESTART WITH 1;
INSERT INTO detalle_renta (fecha_adquisición, fecha_devolucion, estado_renta, monto_total) VALUES
('2024-01-10', '2024-06-04', 'Activa', '3'),
('2024-10-02', '2024-10-23', 'Finalizada', '4'),
('2023-04-28', '2025-01-21', 'Cancelada', '8'),
('2024-10-13', '2025-03-27', 'Finalizada', '6'),
('2024-12-20', '2025-01-22', 'Cancelada', '8'),
('2024-11-19', '2025-01-30', 'Activa', '9'),
('2024-10-07', '2024-12-11', 'Finalizada', '1'),
('2024-08-06', '2024-10-05', 'Cancelada', '7'),
('2024-11-26', '2025-04-24', 'Activa', '6'),
('2024-05-31', '2024-06-09', 'Finalizada', '3'),
('2024-06-04', '2024-08-20', 'Cancelada', '5'),
('2024-04-15', '2024-09-17', 'Activa', '7'),
('2024-12-09', '2025-03-08', 'Finalizada', '4'),
('2024-04-29', '2024-10-16', 'Cancelada', '7'),
('2024-06-16', '2024-09-16', 'Activa', '8'),
('2024-09-18', '2025-04-25', 'Finalizada', '6'),
('2024-02-25', '2024-08-12', 'Cancelada', '3'),
('2023-05-23', '2024-11-27', 'Activa', '9'),
('2024-06-02', '2025-03-27', 'Finalizada', '1'),
('2024-10-06', '2025-03-06', 'Cancelada', '8'),
('2024-07-07', '2024-07-30', 'Activa', '2'),
('2024-08-07', '2024-09-07', 'Finalizada', '4'),
('2024-08-13', '2024-12-29', 'Cancelada', '6'),
('2023-05-10', '2024-05-24', 'Activa', '5'),
('2024-04-12', '2024-12-22', 'Finalizada', '8'),
('2025-04-02', '2025-04-14', 'Cancelada', '2'),
('2023-03-21', '2024-09-02', 'Activa', '5'),
('2024-05-27', '2025-04-28', 'Finalizada', '4'),
('2024-12-02', '2025-01-29', 'Cancelada', '8'),
('2024-04-26', '2024-08-20', 'Activa', '8');

-- ---------------------------
-- 3. Tabla instrumento
-- ---------------------------
INSERT INTO instrumento (nombre_instrumento, tipo_instrumento, marca, estado, precio_renta) VALUES
('Trompeta', 'Metal', 'Stradivarius', 'Disponible', '4.19'),          
('Piano', 'Electrofonos', 'Steinway', 'Rentado', '18.99'),            
('Violín', 'Cuerdas', 'Bach', 'Mantenimiento', '8.99'),               
('Batería', 'Percusión', 'Pearl', 'Disponible', '4.79'),              
('Saxofón', 'Viento', 'Yamaha', 'Rentado', '79.99'),                  
('Batería', 'Percusión', 'Selmer', 'Mantenimiento', '3.29'),          
('Clarinete', 'Viento', 'Thomann', 'Disponible', '79.99'),            
('Trompeta', 'Metal', 'Lyon & Healy', 'Rentado', '45'),               
('Guitarra', 'Electrofonos', 'Fender', 'Mantenimiento', '15.99'),     
('Violín', 'Cuerdas', 'Buffet Crampon', 'Disponible', '39.99'),       
('Flauta', 'Viento', 'Stradivarius', 'Rentado', '34.99'),             
('Batería', 'Percusión', 'Thomann', 'Mantenimiento', '3.29'),         
('Trompeta', 'Metal', 'Bach', 'Disponible', '1.5'),                   
('Violín', 'Cuerdas', 'Buffet Crampon', 'Rentado', '7.99'),          
('Piano', 'Electrofonos', 'Steinway', 'Mantenimiento', '1.89'),       
('Violín', 'Cuerdas', 'Pearl', 'Disponible', '3.99'),                 
('Trompeta', 'Metal', 'Yamaha', 'Rentado', '49.99'),                  
('Sintetizador', 'Electrofonos', 'Lyon & Healy', 'Mantenimiento', '8.99'), 
('Saxofón', 'Viento', 'Selmer', 'Disponible', '5.49'),                
('Batería', 'Percusión', 'Fender', 'Rentado', '2.99'),                
('Batería', 'Percusión', 'Stradivarius', 'Mantenimiento', '3.99'),    
('Flauta', 'Viento', 'Lyon & Healy', 'Disponible', '69.99'),          
('Violín', 'Cuerdas', 'Pearl', 'Rentado', '49.99'),                   
('Trompeta', 'Metal', 'Thomann', 'Mantenimiento', '15.99'),           
('Piano', 'Electrofonos', 'Steinway', 'Disponible', '19.99'),         
('Saxofón', 'Viento', 'Selmer', 'Rentado', '1.99'),                   
('Batería', 'Percusión', 'Fender', 'Mantenimiento', '39.99'),         
('Trompeta', 'Metal', 'Buffet Crampon', 'Disponible', '24.99'),       
('Sintetizador', 'Electrofonos', 'Yamaha', 'Rentado', '2.99'),        
('Violín', 'Cuerdas', 'Bach', 'Mantenimiento', '24.99');              

-- ---------------------------
-- 4. Tabla inventario
-- ---------------------------
INSERT INTO inventario (id_instrumento, cant_instrumento) VALUES
('29', '21'),
('4', '94'),
('21', '98'),
('6', '95'),
('5', '92'),
('1', '11'),
('9', '71'),
('15', '58'),
('20', '28'),
('10', '45'),
('7', '72'),
('24', '13'),
('17', '8'),
('25', '44'),
('26', '20'),
('18', '17'),
('28', '19'),
('19', '77'),
('11', '69'),
('12', '92'),
('13', '27'),
('30', '24'),
('14', '35'),
('16', '84'),
('2', '93'),
('3', '30'),
('22', '91'),
('23', '88'),
('8', '76'),
('27', '42');

-- ---------------------------
-- 5. Tabla renta
-- ---------------------------
INSERT INTO renta (id_instrumento, id_cliente, id_detalleRenta) VALUES
('12', '4', '1'),
('13', '25', '11'),
('16', '14', '9'),
('10', '28', '23'),
('21', '26', '3'),
('30', '11', '22'),
('26', '27', '14'),
('4', '19', '28'),
('6', '13', '2'),
('27', '3', '5'),
('9', '16', '10'),
('19', '22', '6'),
('2', '20', '29'),
('23', '10', '18'),
('7', '23', '16'),
('8', '21', '19'),
('3', '8', '4'),
('17', '6', '17'),
('28', '1', '25'),
('25', '30', '20'),
('29', '15', '13'),
('24', '2', '24'),
('1', '18', '21'),
('15', '5', '8'),
('14', '9', '27'),
('5', '7', '30'),
('20', '17', '12'),
('11', '29', '15'),
('22', '24', '26'),
('18', '12', '7');