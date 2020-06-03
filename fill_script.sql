INSERT INTO agronomists (first_name,last_name) 
VALUES 
('Brandon','Bullock'),('Selma','Snider'),
('Kyra','Holder'),('Heather','Ramsey'),
('Marvin','Schneider'),('Mary','Morales'),
('Robin','Kirby'),('Savannah','Baldwin'),
('Ivor','Holden'),('Kennan','Swanson'),
('Lara','Roberts'),('Natalie','Rojas'),
('Tallulah','Petersen'),('Yetta','Lancaster'),
('Alexa','Henry'),('Sylvester','Stark'),
('Bo','Coffey'),('Burton','Long'),
('Lacey','Gregory'),('Montana','Vargas'),
('Brenna','George'),('Raphael','Schwartz'),
('Flynn','Cote'),('Bell','Shannon'),
('Dale','Duncan'),('Joel','Franks'),
('Mannix','Welch'),('Owen','Cunningham'),
('Rylee','Coffey'),('Kim','Miller');

INSERT INTO customers (first_name,last_name)
VALUES
('Rama','Sweeney'),('Benedict','Delaney'),
('Hilda','Good'),('Christian','Middleton'),
('Cora','Mcfarland'),('Colby','Walsh'),
('Harlan','Leonard'),('Fay','Cannon'),
('Adrian','Joseph'),('Emily','Barry'),
('Tad','Dorsey'),('Ronan','Fields'),
('Shelley','Mills'),('Ivan','William'),
('Jane','Levine'),('Rosalyn','Peters'),
('Libby','Barlow'),('Jerome','Yates'),
('Caldwell','Mcconnell'),('Wang','Kemp'),
('Ivor','Bush'),('Dakota','Callahan'),
('Quin','Snow'),('Chaney','Gilmore'),
('Kennan','Case'),('Jonas','Sosa'),
('Ebony','Randolph'),('Bethany','Calhoun'),
('Erica','Booker'),('Cleo','Joyner');

INSERT INTO hemp_sort (sort_name)
VALUES 
('Tibey-amarillo'),('Western Snow Lichen'),
('Thickstem Wild Cabbage'),('Metamelaena Lichen'),
('Western Giant Hyssop'),('Fendler''s Meadow-rue'),
('Beet'),('Red Monardella'),
('Dwarf Crabgrass'),('Black Disc Lichen'),
('Slender Threeseed Mercury'),('Apalachicola False Rosemary'),
('Texas Pricklyleaf'),('Calamus'),
('Evergreen Sumac'),('Maguire''s Milkvetch'),
('Spreading Eryngo'),('Mountain Heather'),
('Hammock Velvetseed'),('Crossidium Moss');

INSERT INTO business_trips_groups (title)
VALUES 
('Massa Integer Vitae Associates'),
('Donec Egestas Aliquam Incorporated'),
('Fermentum Convallis Ligula PC'),
('Duis LLP'),
('Nulla In LLC'),
('Egestas Nunc Sed Industries'),
('Et Ultrices Posuere Associates'),
('Risus Donec Nibh Corp.'),
('Duis At Lacus Institute'),
('Proin Sed Turpis Foundation');

INSERT INTO bt_group_members (bt_group_id,agronom_id) 
VALUES 
(1,28),(1,5),(1,29),(1,6),
(1,11),(1,24),(1,9),(1,20),
(1,6),(1,7),(1,9),(1,4),
(6,18),(6,30),(6,16),(6,22),
(6,17),(6,16),(6,26),(6,12),
(6,15),(6,2),(3,4),(3,18),
(3,12),(3,28),(5,3),(5,21),
(5,24),(5,2),(5,2),(5,28),
(5,18),(5,1),(5,29),(5,18),
(5,2),(5,12),(5,16),(4,30),
(4,26),(4,19),(4,8),(4,25),
(4,18),(4,12),(4,12),(4,11),
(4,17),(4,25),(4,7),(4,20),
(4,9),(4,17),(4,30),(2,16),
(2,13),(2,6),(2,24),(2,26),
(2,11),(2,20);

INSERT INTO business_trips (bt_group_id,start_date,finish_date)
VALUES 
-- Summer 2019
(1,'2019-06-19','2019-08-27'),(3,'2019-06-07','2019-07-04'),
(4,'2019-06-26','2019-07-29'),(3,'2019-07-16','2019-09-12'),
(4,'2019-08-01','2019-06-23'),(2,'2019-06-15','2019-07-15'),
(4,'2019-04-18','2019-09-03'),(4,'2019-05-09','2019-07-25'),
(4,'2019-06-30','2019-09-07'),(4,'2019-05-10','2019-08-27'),
(4,'2019-04-07','2019-07-20'),(4,'2019-07-20','2019-08-18'),
(6,'2019-06-10','2019-06-26'),(3,'2019-04-27','2019-07-23'),
(5,'2019-06-12','2019-07-01'),(4,'2019-07-01','2019-09-09'),
(2,'2019-04-17','2019-07-07'),
-- Autumn 2019
(2,'2019-12-10','2020-03-17'),(4,'2019-10-04','2020-03-01'),
(1,'2019-12-02','2020-03-11'),(2,'2020-01-12','2020-03-01'),
(6,'2019-10-18','2020-03-19'),(6,'2019-10-22','2020-03-02'),
(6,'2019-12-29','2020-03-18'),(1,'2019-12-26','2020-03-12'),
(5,'2020-01-02','2020-03-03'),(5,'2019-12-04','2020-03-10'),
(1,'2019-12-02','2020-03-15'),(6,'2020-01-05','2020-03-17');

INSERT INTO harvests (agronom_id,hemp_sort_id,start_date,finish_date) 
VALUES 
-- Summer 2019
-- 2
(2,1,'24/06/2019','21/09/2019'),
(2,18,'11/05/2019','13/08/2019'),
(2,16,'16/06/2019','18/09/2019'),
(2,19,'08/05/2019','09/08/2019'),
(2,14,'03/06/2019','18/07/2019'),
(2,20,'08/05/2019','07/07/2019'),
(2,9,'19/06/2019','27/09/2019'),
(2,11,'20/06/2019','27/09/2019'),
(2,16,'19/06/2019','06/09/2019'),
-- 14
(14,16,'25/05/2019','07/09/2019'),
(14,12,'18/05/2019','15/08/2019'),
(14,10,'26/06/2019','07/07/2019'),
(14,20,'25/06/2019','20/08/2019'),
(14,3,'05/06/2019','08/09/2019'),
-- 11
(11,12,'20/05/2019','25/08/2019'),
(11,16,'29/05/2019','09/09/2019'),
(11,2,'11/06/2019','13/07/2019'),
(11,4,'24/06/2019','12/09/2019'),
-- 5
(5,20,'01/07/2019','06/09/2019'),
-- 8
(8,12,'08/05/2019','05/09/2019'),
(8,20,'09/05/2019','15/08/2019'),
(8,2,'07/06/2019','05/07/2019'),
(8,11,'03/05/2019','16/07/2019'),
-- 7
(7,11,'11/05/2019','19/07/2019'),
(7,6,'14/06/2019','31/07/2019'),
(7,20,'23/06/2019','26/07/2019'),
(7,12,'05/05/2019','10/09/2019'),
(7,10,'20/05/2019','08/08/2019'),
(7,4,'23/05/2019','25/07/2019'),
-- 13
(13,11,'19/05/2019','22/08/2019'),
(13,11,'31/05/2019','18/07/2019'),
(13,9,'03/05/2019','05/08/2019'),
(13,3,'31/05/2019','04/08/2019'),
(13,15,'26/05/2019','26/09/2019'),
(13,1,'21/06/2019','20/07/2019'),
(13,4,'10/06/2019','03/07/2019'),
-- 6
(6,8,'07/05/2019','04/07/2019'),
(6,9,'23/05/2019','11/08/2019'),
(6,16,'16/06/2019','17/08/2019'),
(6,1,'03/06/2019','05/08/2019'),
(6,3,'04/05/2019','12/09/2019'),
(6,4,'03/05/2019','07/08/2019'),
-- Summer 2020
-- 2
(2,2,'22/06/2020','17/07/2020'),
(2,9,'10/06/2020','12/08/2020'),
-- 12
(12,8,'09/05/2020','08/08/2020'),
(12,3,'15/05/2020','25/08/2020'),
(12,3,'18/06/2020','15/08/2020'),
(12,5,'31/05/2020','02/07/2020'),
(12,9,'20/06/2020','16/07/2020'),
-- 11
(11,7,'05/05/2020','03/08/2020'),
(11,8,'17/05/2020','23/07/2020'),
(11,12,'24/06/2020','01/09/2020'),
(11,2,'10/05/2020','30/08/2020'),
(11,20,'17/05/2020','24/08/2020'),
(11,2,'28/06/2020','21/08/2020'),
-- 1
(1,13,'07/05/2020','05/08/2020'),
(1,1,'29/06/2020','24/08/2020'),
(1,9,'20/06/2020','04/07/2020'),
(1,1,'12/06/2020','15/07/2020'),
(1,8,'26/06/2020','01/08/2020'),
(1,12,'14/05/2020','05/07/2020'),
(1,16,'25/06/2020','15/07/2020'),
-- 10
(10,4,'24/05/2020','28/08/2020'),
(10,13,'15/06/2020','30/07/2020'),
(10,10,'23/05/2020','10/08/2020'),
-- 14
(14,19,'10/05/2020','19/08/2020'),
(14,14,'11/05/2020','16/08/2020'),
(14,5,'04/05/2020','27/08/2020'),
(14,5,'03/06/2020','18/07/2020'),
-- 5
(5,10,'29/05/2020','23/08/2020'),
(5,2,'12/06/2020','02/07/2020'),
(5,13,'31/05/2020','02/07/2020'),
-- 9
(9,10,'04/06/2020','16/08/2020'),
(9,13,'06/05/2020','29/07/2020'),
-- 7
(7,9,'28/05/2020','03/08/2020'),
(7,7,'02/06/2020','22/08/2020'),
(7,13,'27/06/2020','17/08/2020'),
(7,2,'17/05/2020','09/08/2020'),
(7,3,'12/06/2020','09/07/2020'),
(7,5,'27/05/2020','02/08/2020'),
(7,12,'18/05/2020','04/07/2020');


INSERT INTO products (prod_name, agronom_id) 
VALUES
('Alamo', 2),
('Salting the Battlefield', 1),
('Recipes for Disaster', 13),
('Barbarian Invasions', 3),
('Cain and Mabel', 7),
('Best Man, The', 1),
('Golden Earrings', 13),
('Under the Flag of the Rising Sun', 11),
('Meatballs Part II', 12),
('Caiman', 2),
('Astro Boy', 1),
('The Trap', 5),
('Cost of Living', 1),
('On Deadly Ground', 12),
('Skeleton Twins', 10);

INSERT INTO product_items (product_id, hemp_id)
VALUES
(1, 9), (1, 20),
(1, 6), (2, 2),
(2, 19), (2, 6),
(3, 6), (4, 2),
(4, 11), (4, 7),
(5, 16), (5, 14),
(5, 6), (5, 15),
(6, 16), (6, 17),
(7, 15), (8, 10),
(8, 3), (8, 5),
(8, 7), (9, 8),
(10, 16), (10, 4),
(10, 20), (11, 16),
(11, 12), (11, 4),
(11, 14), (12, 1),
(12, 2), (12, 3),
(13, 1), (13, 13),
(13, 14), (14, 16),
(14, 2), (14, 7);

INSERT INTO tsts_groups (title) 
VALUES
('Shanahan Lockman and Keebler'),
('Predovic-Blick'),
('Bashirian-Carter'),
('Kassulke and Sons'),
('Gutkowski Inc'),
('Koepp West and Beer'),
('Lueilwitz Cruickshank and O''Connell'),
('Heidenreich-Ondricka'),
('Koch LLC'),
('Zulauf-Shields'),
('Cormier and Sons'),
('Mayert Group'),
('Mohr Group'),
('Beatty-Stiedemann'),
('Braun LLC'),
('Leuschke-Grady'),
('Gislason-Hermiston'),
('Volkman-Nader'),
('Monahan and Sons'),
('Ziemann Rau and Rowe'),
('Kautzer-Aufderhar'),
('Grady-Jacobson'),
('Lesch Group'),
('Kozey Dibbert and Treutel'),
('Stoltenberg-Brown'),
('Pfeffer Pagac and Pacocha'),
('Mosciski-Walter'),
('Hamill Hand and Bosco'),
('Padberg Will and Gleichner'),
('Raynor-Kshlerin'),
('Abbott Inc'),
('Nolan Group'),
('Lowe Group'),
('Fay Jacobi and Kling'),
('Morissette Torphy and Lind'),
('Stroman Bernhard and Willms'),
('Swaniawski and Sons'),
('Gislason-Stanton'),
('Predovic Lowe and Mante'),
('Klein Kassulke and Von'),
('Gleichner Kirlin and Pfannerstill'),
('Eichmann and Sons'),
('Predovic-Schmitt'),
('Hane Inc'),
('Kris McGlynn and Jakubowski'),
('Upton-Erdman'),
('Greenfelder-Dicki'),
('Veum Harris and Aufderhar'),
('Brekke Schulist and Kuhn'),
('Reinger and Sons');

INSERT INTO tasting_group_members (tsts_groups_id, customer_id)
VALUES
-- 1
(1, 1), (1, 3), (1, 5), (1, 8),
(1, 10), (1, 11), (1, 12), (1, 13),
(1, 14), (1, 16), (1, 17), (1, 18),
(1, 21), (1, 24), (1, 25), (1, 28),
(1, 29), (1, 30),
-- 2
(2, 1), (2, 2), (2, 3), (2, 5),
(2, 6), (2, 7), (2, 8), (2, 13),
(2, 14), (2, 16), (2, 18), (2, 19),
(2, 23), (2, 24), (2, 27), (2, 28),
(2, 30),
-- 3
(3, 1), (3, 3), (3, 4), (3, 5),
(3, 6), (3, 7), (3, 9), (3, 12),
(3, 13), (3, 16), (3, 17), (3, 19),
(3, 21), (3, 25), (3, 28), (3, 30),
-- 4
(4, 3), (4, 4), (4, 5), (4, 6),
(4, 8), (4, 9), (4, 11), (4, 12),
(4, 15), (4, 16), (4, 19), (4, 21),
(4, 23), (4, 25), (4, 27), (4, 29),
-- 5
(5, 4), (5, 6), (5, 8), (5, 9),
(5, 20), (5, 23), (5, 28),
-- 6
(6, 2), (6, 4), (6, 6), (6, 7),
(6, 8), (6, 10), (6, 12), (6, 15),
(6, 16), (6, 19), (6, 20), (6, 21),
(6, 23), (6, 26), (6, 27), (6, 28),
(6, 29),
-- 7
(7, 24), (7, 28), (7, 4), (7, 21),
-- 8
(8, 9),
-- 9
(9, 8), (9, 13), (9, 14), (9, 18),
(9, 25), (9, 26), (9, 30),
-- 10
(10, 6), (10, 17),
(10, 21), (10, 22), (10, 23),
-- 11
(11, 2), (11, 4), (11, 6), (11, 7),
(11, 8), (11, 9), (11, 10), (11, 11),
(11, 14), (11, 18), (11, 21), (11, 22),
(11, 24), (11, 30),
-- 12
(12, 3), (12, 4), (12, 9), (12, 12),
(12, 14), (12, 19), (12, 20), (12, 24),
(12, 29),
-- 13
(13, 21), (13, 20), (13, 29), (13, 14),
-- 14
(14, 8),(14, 3), (14, 12),(14, 4),
-- 15
(15, 4), (15, 5), (15, 6), (15, 10),
(15, 11), (15, 12), (15, 13), (15, 14),
(15, 15), (15, 18), (15, 22), (15, 23),
(15, 24), (15, 27), (15, 28), (15, 29),
-- 16
(16, 1), (16, 2), (16, 3), (16, 4),
(16, 9), (16, 11), (16, 13), (16, 15),
(16, 18), (16, 23), (16, 27),
-- 17
(17, 3), (17, 4), (17, 6), (17, 11),
(17, 12), (17, 13), (17, 14), (17, 15),
(17, 18), (17, 21), (17, 22), (17, 25),
(17, 26),
-- 18
(18, 1), (18, 5), (18, 6), (18, 7),
(18, 8), (18, 9), (18, 13), (18, 14),
(18, 15), (18, 16), (18, 24), (18, 26),
(18, 27), (18, 29),
-- 19
(19, 1), (19, 4), (19, 5), (19, 8),
(19, 11), (19, 12), (19, 13), (19, 17),
(19, 18), (19, 19), (19, 20), (19, 23),
(19, 24), (19, 25), (19, 27), (19, 28),
(19, 30),
-- 20
(20, 1), (20, 2), (20, 9), (20, 11),
(20, 12), (20, 14), (20, 15), (20, 16),
(20, 19), (20, 20), (20, 26), (20, 27),
(20, 28), (20, 29), (20, 30),
-- 21
(21, 4), (21, 5), (21, 23), (21, 27),
(21, 29), (21, 30),
-- 22
(22, 1), (22, 2), (22, 3), (22, 4),
(22, 5), (22, 9), (22, 13), (22, 16),
(22, 18), (22, 21), (22, 29), (22, 30),
-- 23
(23, 6), (23, 7), (23, 10), (23, 12),
(23, 14), (23, 15), (23, 17), (23, 18),
(23, 19), (23, 20), (23, 21), (23, 24),
(23, 27), (23, 28), (23, 30),
-- 24
(24, 1), (24, 3), (24, 5), (24, 6),
(24, 7), (24, 8), (24, 9), (24, 11),
(24, 12), (24, 14), (24, 16), (24, 17),
(24, 19), (24, 20), (24, 21), (24, 26),
(24, 27), (24, 28), (24, 29),
-- 25
(25, 10), (25, 3), (25, 20), (25, 22),
-- 26
(26, 27), 
-- 27
(27, 2), (27, 8), (27, 14), (27, 18),
(27, 22), (27, 28), (27, 30),
-- 28
(28, 2), (28, 7), (28, 10), (28, 16),
(28, 18), (28, 27), (28, 29), (28, 30),
-- 29
(29, 10), (29, 21), (29, 29),
-- 30
(30, 2), (30, 11),
-- 31
(31, 2), (31, 3), (31, 5), (31, 7), (31, 8), (31, 9), (31, 10), (31, 14),
(31, 15), (31, 19), (31, 20), (31, 21), (31, 22), (31, 23), (31, 24), (31, 26),
(31, 28), (31, 29),
-- 32
(32, 2), (32, 4), (32, 6), (32, 10),
(32, 14), (32, 15), (32, 17), (32, 18),
(32, 19), (32, 22), (32, 23), (32, 24),
(32, 25), (32, 26), (32, 28), (32, 29), (32, 30), 
-- 33
(33, 8), (33, 25),
-- 34
(34, 25), (34, 12), (34, 4),
-- 35
(35, 1), (35, 3), (35, 6), (35, 7),
(35, 9), (35, 11), (35, 12), (35, 13),
(35, 16), (35, 17), (35, 19), (35, 20),
(35, 23), (35, 24), (35, 26), (35, 27),
(35, 28), (35, 30),
-- 36
(36, 1), (36, 2),
(36, 3), (36, 6),
(36, 9), (36, 17),
(36, 19), (36, 20),
(36, 22), (36, 23),
-- 37
(37, 2), (37, 3),
(37, 6), (37, 8),
(37, 9), (37, 22),
(37, 27), (37, 29),
(37, 30),
-- 38
(38, 2), (38, 8),
(38, 17), (38, 21),
(38, 28), (39, 1),
-- 39
(39, 4), (39, 5),
(39, 9), (39, 11),
(39, 14), (39, 20),
(39, 24), (39, 26),
-- 40
(40, 2), (40, 5), (40, 6), (40, 7),
(40, 8), (40, 10), (40, 12), (40, 13),
(40, 14), (40, 15), (40, 16), (40, 17),
(40, 18), (40, 19), (40, 21), (40, 23),
(40, 24), (40, 26), (40, 27), (40, 30),
-- 41
(41, 2), (41, 4), (41, 20), (41, 14),
-- 42
(42, 1), (42, 2), (42, 3), (42, 4),
(42, 5), (42, 6), (42, 7), (42, 8),
(42, 9), (42, 10), (42, 13), (42, 14),
(42, 15), (42, 16), (42, 22), (42, 23),
(42, 25), (42, 30),
-- 43
(43, 2), (43, 5), (43, 6), (43, 7),
(43, 11), (43, 12), (43, 13), (43, 14),
(43, 15), (43, 16), (43, 17), (43, 18),
(43, 19), (43, 20), (43, 22), (43, 23),
(43, 24), (43, 27), (43, 30),
-- 44
(44, 16), (44, 17), (44, 19), (44, 20), (44, 21), (44, 29),
-- 45
(45, 11), (45, 16), (45, 19), (45, 21), (45, 22), (45, 26), (45, 29), 
-- 46
(46, 11), (46, 21),
-- 47
(47, 8), (47, 16),
-- 48
(48, 10), (48, 11), (48, 14), (48, 15), (48, 16), (48, 17), (48, 23), (48, 25), (48, 28), (48, 29),
-- 49
(49, 4), (49, 7), (49, 9), (49, 10), (49, 12), (49, 16), (49, 17), (49, 19), (49, 20), (49, 22), (49, 24), (49, 25),
-- 50
(50, 2), (50, 12), (50, 7);

INSERT INTO tastings (tsts_groups_id,product_id,tasting_date) 
VALUES 
(13,5,'29/04/2020'),(41,8,'18/11/2019'),(47,9,'02/12/2019'),(19,1,'29/11/2019'),(5,6,'26/06/2020'),(32,1,'04/08/2019'),(8,13,'10/01/2020'),(28,11,'07/07/2019'),(7,8,'07/12/2019'),(31,6,'27/04/2020'),
(1,9,'15/11/2019'),(49,10,'08/04/2020'),(38,3,'13/07/2019'),(3,15,'25/03/2020'),(14,12,'12/06/2019'),(24,12,'23/11/2019'),(49,11,'23/06/2019'),(11,9,'11/11/2019'),(13,9,'12/09/2019'),(31,3,'25/04/2020'),
(39,7,'11/05/2020'),(3,8,'01/05/2020'),(14,9,'25/11/2019'),(22,11,'06/06/2020'),(33,6,'05/08/2019'),(5,6,'25/05/2020'),(10,4,'02/11/2019'),(35,11,'31/03/2020'),(10,12,'24/03/2020'),(17,6,'30/07/2019'),
(47,4,'07/04/2020'),(17,11,'26/07/2019'),(5,14,'16/09/2019'),(46,9,'18/09/2019'),(41,9,'27/05/2020'),(48,13,'19/07/2019'),(4,10,'21/06/2019'),(28,11,'10/01/2020'),(36,1,'27/04/2020'),(31,6,'16/11/2019'),
(25,10,'30/11/2019'),(18,10,'19/06/2019'),(19,2,'17/11/2019'),(3,4,'14/05/2020'),(22,5,'06/04/2020'),(29,4,'18/06/2019'),(17,10,'20/06/2020'),(11,7,'04/09/2019'),(34,6,'19/01/2020'),(40,5,'30/09/2019'),
(36,5,'06/09/2019'),(14,9,'09/04/2020'),(33,15,'22/01/2020'),(29,13,'09/06/2019'),(32,1,'30/04/2020'),(2,3,'02/05/2020'),(19,3,'03/03/2020'),(5,8,'17/08/2019'),(6,11,'23/09/2019'),(32,8,'06/10/2019'),
(33,6,'18/03/2020'),(12,14,'19/12/2019'),(9,9,'14/06/2019'),(29,3,'23/01/2020'),(11,13,'21/03/2020'),(28,5,'16/09/2019'),(23,6,'02/10/2019'),(7,5,'13/01/2020'),(46,2,'13/07/2019'),(32,7,'21/06/2019'),
(21,5,'05/06/2020'),(13,5,'10/07/2019'),(3,6,'20/07/2019'),(25,13,'28/03/2020'),(8,6,'06/05/2020'),(48,3,'20/11/2019'),(13,13,'17/06/2019'),(41,6,'07/06/2019'),(14,8,'11/06/2019'),(1,12,'04/08/2019'),
(22,11,'13/09/2019'),(38,4,'25/05/2020'),(16,4,'08/06/2019'),(37,4,'08/01/2020'),(29,14,'06/03/2020'),(16,14,'12/11/2019'),(18,5,'27/12/2019'),(49,2,'30/06/2019'),(8,12,'31/08/2019'),(47,12,'21/03/2020'),
(48,3,'17/12/2019'),(23,6,'12/01/2020'),(42,9,'15/04/2020'),(15,2,'06/01/2020'),(49,9,'28/09/2019'),(49,10,'20/01/2020'),(41,5,'07/10/2019'),(13,13,'27/07/2019'),(47,4,'17/05/2020'),(9,6,'21/08/2019');


INSERT INTO complaints (customer_id, text_complaints, comp_date) 
VALUES 
(10,'in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus','02/02/2020'),
(6,'ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,','14/01/2020'),
(2,'consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla','09/07/2019'),
(9,'blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel','07/11/2019'),
(9,'dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et','23/11/2019'),
(15,'magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus.','11/09/2019'),
(7,'luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet','13/06/2019'),
(12,'Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit,','12/03/2020'),
(7,'a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum','11/05/2020'),
(15,'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc','09/01/2020'),
(14,'Fusce diam','27/08/2019'),
(4,'lectus, a sollicitudin orci sem eget massa. Suspendisse','22/12/2019'),
(7,'dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut','16/05/2020'),
(2,'ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor','28/09/2019'),
(11,'mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu','28/06/2019'),
(11,'venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci.','30/01/2020'),
(15,'interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non','07/06/2020'),
(4,'consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.','17/10/2019'),
(9,'sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim','09/12/2019'),
(6,'adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan','09/04/2020'),
(15,'ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi','18/03/2020'),
(15,'nunc sed libero. Proin sed turpis nec mauris blandit mattis.','25/08/2019'),
(7,'mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem.','16/02/2020'),
(2,'tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit.','17/08/2019'),
(13,'est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna.','19/09/2019'),
(6,'egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique','19/01/2020'),
(2,'varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a','13/12/2019'),
(14,'Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam','14/03/2020'),(8,'metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas','21/09/2019'),(9,'enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut','18/06/2020'),
(1,'nisi magna sed dui. Fusce','16/01/2020'),
(4,'nec, diam. Duis','20/01/2020'),
(7,'ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque.','11/08/2019'),
(7,'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam','28/07/2019'),
(6,'amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus.','24/11/2019'),
(7,'Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede','27/02/2020'),
(12,'augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis','02/10/2019'),
(11,'pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.','26/06/2019'),
(8,'lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis','11/02/2020'),
(3,'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam','09/11/2019');
