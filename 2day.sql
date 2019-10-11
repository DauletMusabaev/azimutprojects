select * from regions;
select * from directories;
select * from unihools;

select name, count(building_id) as univerandschool from directories d 
	join regions r on d.region_id = r.id group by name;
	
select r.name, count(d.building_id) from unihools u
	join directories d on d.building_id = u.id
	join regions r on d.region_id = r.id where u.type = 1 group by r.name;


WITH RECURSIVE r AS(
	SELECT id, parent_id, name, 1 as level
	FROM regions 
	WHERE id = 1
	
	UNION 
	
	SELECT reg.id, reg.parent_id, reg.name, r.level + 1 as level
	FROM regions reg
		INNER JOIN r 
			ON reg.parent_id = r.id 		
) 
SELECT * FROM r;

with recursive r as (
select * from regions
union
select rm.* from regions rm join r rc on rc.id = rm.parent_id 
)
select * from r
