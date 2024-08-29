USE kaamelott;

-- Dans un fichier .sql, les tirets en début de ligne permettent de commenter du code 
-- afin qu'il ne soit pas exécuté
-- ⬇ écrire les requêtes de l'atelier ici ⬇




--Le prénom, nom et âge des personnages

select * from person;

-- Le prénom, nom des personnages ainsi que leur royaume, uniquement pour ceux étant reliés à un royaume

select person.id , person.firstname, person.lastname, kingdom.name from person inner join kingdom on person.kingdom_id=kingdom.id;

--La même chose en incluant tous les personnages


select person.id , person.firstname, person.lastname, kingdom.name from person  as p left join kingdom as k on person.kingdom_id=kingdom.id;


-- La moyenne de l’âge des personnages

select avg(age) as 'average' from person;

--  La moyenne de tous les personnages n’ayant pas le rôle de magicien

select avg(p.age) as 'Average' from person as p inner join role as r on p.role_id=r.id where r.role <> 'Magicien' ;
select avg(p.age) as 'Average' from person as p inner join role as r on p.role_id=r.id where not r.role = 'Magicien' ;

-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)

select kingdom.name , count(person.id) as 'Total' from kingdom left join person on kingdom.id=person.kingdom_id group by kingdom.name ;

--La moyenne de l’âge par rôle

select Role.role , avg(person.age) from person inner join Role on person.role_id=Role.id group by Role.role ;

-- La liste de tous les personnages avec leur rôle et royaume éventuels

select person.id , person.firstname, person.lastname, kingdom.name, role.role from person
left join kingdom on person.kingdom_id=kingdom.id 
left join role on person.role_id=role.id;

-- La liste des royaumes ayant au moins 2 sujets

select kingdom.name , count(person.id) as 'nb_person_kingdom' 
from kingdom left join person on kingdom.id=person.kingdom_id group by kingdom.name having count(person.id)  >=2;
