create table unihools(
	id Serial PRIMARY KEY,
	name VARCHAR(50),
	place VARCHAR(50),
	phone INT,
	type INT
);

INSERT INTO unihools(name, place, phone, type) VALUES('KazNU', 'Timiryazev, 48', 2222221, 1),
													 ('SDU', 'Kaskelen, 37', 2222220, 1),
													 ('IITU', 'Satpayev, 26', 2222223, 1),
													 ('SU', 'Satpayev, 15', 2222224, 1),
													 ('Asfendiyarov', 'Tole bi, 45', 2222225, 1),
													 ('KRMU', 'Abylaikhan, 44', 2222226, 1),
													 ('AST', 'Abay, 65', 2222227, 1),
													 ('UIB', 'Abay, 68', 2222228, 1),
													 ('KIMEP', 'Abay, 56', 2222229, 1),
													 ('AlmaU', 'Rozybakiev, 75', 2100100, 1),
													 ('ZhenPU', 'Gogol, 186', 2100101, 1);
													 
INSERT INTO unihools(name, place, phone, type) VALUES('178 Lyceum', 'Dospanova, 147', 2100102, 2),
													 ('12 Gymnasium', 'Valikhanov, 251', 2100103, 2),
													 ('RPhMSScI', 'Bukhar zhyrau, 24', 2100104, 2),
													 ('180 School', 'Algabas, 1', 2100105, 2),
													 ('181 School', 'Akkent, 01', 2100106, 2),
													 ('182 School', 'Algabas 4', 2100107, 2),
													 ('149 School', 'Lenin, 85', 2100108, 2),
													 ('171 School', 'Lenin, 84', 2100109, 2);

CREATE TABLE regions(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	par_id INTEGER REFERENCES regions(id)
);

INSERT INTO regions(name, par_id) VALUES('Almaty', NULL),
										('Nur-Sultan', NULL),
										('Karagandy', NULL),
										('Shymkent', NULL),
										('Alatau', 1),
										('Nauryzbay', 1),
										('Auezov', 1),
										('Almaly', 1),
										('Zhetisu', 1),
										('Turksib', 1),
										('Medeu', 1),
										('Bostandyk', 1),
										('Almaty', 2),
										('SaryArka', 2),
										('Esil', 2),
										('Baykonur', 2),
										('Abay', 4),
										('Al Farabi', 4),
										('Enbekshi', 4),
										('Karatau', 4),
										('October', 3),
										('Kazybekbi', 3);

CREATE TABLE directories(
	id SERIAL PRIMARY KEY, 
	name VARCHAR(50),
	place_id INT REFERENCES unihools(id),
	region_id INT REFERENCES regions(id)
);

INSERT INTO directories(building_id, region_id) VALUES(9, 12),
													  (10, 11),
													  (11, 12),
													  (12, 9);

select * from directories;
select * from regions;
select * from unihools;


select name, count(region_id) as places from directories d 
	join regions r on d.region_id = r.id  group by name;

select name, count(region_id) from directories d 
	join unihools u on d.building_id = u.id and u.type = 1
	join regions r on r.id = d.region_id group by name;


	select * from regions;
select * from directories;
select * from unihools;

select name, count(building_id) as univerandschool from directories d 
	join regions r on d.region_id = r.id group by name;
	
select r.name, count(d.building_id) from unihools u
	join directories d on d.building_id = u.id
	join regions r on d.region_id = r.id where u.type = 1 group by r.name;


WITH RECURSIVE subregions AS (
   SELECT id, parent_id, name FROM regions 
   UNION SELECT r.id, r.parent_id, r.name FROM regions r
   INNER JOIN subregions s ON s.id = r.parent_id
) SELECT * FROM subregions;

select lower('HELLO'), upper('hellO')