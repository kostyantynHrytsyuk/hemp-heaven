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
