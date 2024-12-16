-- QUERY 1: Climatic conditions summary by habitat type.
SELECT habitat_name, AVG(avg_temp) AS avg_temperature, AVG(elevation) AS avg_elevation
FROM Habitat_type ht
INNER JOIN Habitat h ON ht.habitat_type_id = h.habitat_type_id
GROUP BY 1
ORDER BY 1;


-- QUERY 2: Return all species rescued during October 2024.
SELECT species_name, height, rescue_date
FROM `group-s09_db`.`Species`
WHERE rescue_date LIKE '%2024-10-%'
ORDER BY species_name;


-- QUERY 3: Shows species and what enclosure they are assigned to.
SELECT sp.species_name, an.animal_group, an.weight, en.enclosure_desc
FROM `group-s09_db`.`Species` sp
LEFT OUTER JOIN `group-s09_db`.`Animal` an
    ON sp.species_id = an.species_id
LEFT OUTER JOIN `group-s09_db`.`Enclosure` en
    ON an.enclosure_number = en.enclosure_number
HAVING animal_group IS NOT NULL
ORDER BY sp.species_name;


-- QUERY 4: Returns mammal species involved in studies.
SELECT species_name, COUNT(st.species_id) as cnt, animal_group
FROM Species sp
INNER JOIN Study st ON sp.species_id = st.species_id
INNER JOIN Animal a ON sp.species_id = a.species_id
GROUP BY 1, 3
HAVING animal_group = "Mammal"
ORDER BY 1;


-- QUERY 5: Shows Which researchers were involved in species studies.
SELECT species_name, study_desc, last_name, first_name
FROM Species sp
INNER JOIN Study st ON sp.species_id = st.species_id
INNER JOIN Researcher r ON st.study_id = r.study_id
ORDER BY 1;