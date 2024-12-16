# WildlifeDatabase
SQL Code that reflects the design and implementation of a database, along with intermediate SQL querying examples to gain informational insights.

## Project Objective
Here, I used concepts of ERD modeling and LDM modeling to plan and design a database for a Wildlife Conservation Center. 
I also use intermediate-level SQL querying to extract relevant insights from this relational database.

## Tables/Entities
1. **Soil_type**: soil_type_id, soil_name, soil_desc  
2. **Habitat_type**: habitat_type_id, habitat_name, habitat_desc  
3. **Habitat**: habitat_id, avg_temp, elevation, habitat_type_id, soil_type_id  
4. **Species**: species_id, species_name, height, rescue_date, release_date  
5. **Species_habitat**: species_id, habitat_id  
6. **Enclosure**: enclosure_number, enclosure_area, aquatic_yn, enclosure_desc  
7. **Animal**: species_id, animal_group, weight, enclosure_number  
8. **Plant**: species_id, plant_group, upright_yn  
9. **Study**: study_id, study_title, study_desc, start_date, end_date, species_id  
10. **Researcher**: researcher_id, first_name, last_name, date_of_birth, study_id, supervisor_id  

## Results
The queries were chosen to showcase database functionalities including aggregations, joins, filtering, and pattern matching to gain meaningful insights from the database. Each query involves specific aspects of species and habitat management, while considering applications such as research and operational planning.
