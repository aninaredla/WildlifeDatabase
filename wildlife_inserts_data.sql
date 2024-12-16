INSERT INTO `group-s09_db`.`Soil_type` (`soil_type_id`, `soil_name`, `soil_desc`)
VALUES
(1, 'Clay', 'Dense and sticky soil'),
(2, 'Sandy', 'Loose and gritty soil'),
(3, 'Loamy', 'Fertile and balanced soil'),
(4, 'Peaty', 'Dark and organic soil'),
(5, 'Chalky', 'Alkaline and dry soil');

SELECT * FROM Soil_type;


INSERT INTO `group-s09_db`.`Habitat_type` (`habitat_type_id`, `habitat_name`, `habitat_desc`)
VALUES
(1, 'Forest', 'Dense tree cover'),
(2, 'Grassland', 'Open grassy areas'),
(3, 'Wetland', 'Swampy and waterlogged'),
(4, 'Desert', 'Arid and sandy'),
(5, 'Mountain', 'High-altitude ecosystems');

SELECT * FROM Habitat_type;


INSERT INTO `group-s09_db`.`Habitat` (`habitat_id`, `avg_temp`, `elevation`, `habitat_type_id`, `soil_type_id`)
VALUES
(1, 25.5, 200, 1, 1),
(2, 30.0, 50, 2, 2),
(3, 22.0, 500, 3, 3),
(4, 35.5, 20, 4, 2),
(5, 15.0, 1500, 5, 4);

SELECT * FROM Habitat;


INSERT INTO `group-s09_db`.`Species` (`species_id`, `species_name`, `height`, `rescue_date`, `release_date`) VALUES
(1, 'Bengal Tiger', 120.50, '2024-10-01', '2024-12-15'),
(2, 'Golden Eagle', 85.30, '2024-09-15', NULL),
(3, 'Bamboo', 500.00, '2024-08-10', NULL),
(4, 'Cactus', 75.00, '2024-07-01', NULL),
(5, 'African Elephant', 300.00, '2024-11-01', '2025-01-20');

INSERT INTO `group-s09_db`.`Species` (`species_id`, `species_name`, `height`, `rescue_date`, `release_date`) VALUES
(6, 'Polar Bear', 250.00, '2024-10-10', '2024-12-30'),
(7, 'Green Iguana', 70.00, '2024-09-20', NULL);

INSERT INTO `group-s09_db`.`Species` (`species_id`, `species_name`, `height`, `rescue_date`, `release_date`) VALUES
(8, 'Oak Tree', 1200.00, '2024-10-20', NULL),
(9, 'Rose Shrub', 150.00, '2024-11-05', NULL),
(10, 'Maidenhair Fern', 50.00, '2024-09-10', NULL);

SELECT * FROM Species;


INSERT INTO `group-s09_db`.`Species_habitat` (`species_id`, `habitat_id`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 4);

SELECT * FROM Species_habitat;


INSERT INTO `group-s09_db`.`Enclosure` (`enclosure_number`, `enclosure_area`, `aquatic_yn`, `enclosure_desc`)
VALUES
(1, 500.50, b'0', 'Large land enclosure'),
(2, 300.00, b'1', 'Water-based enclosure'),
(3, 1000.00, b'0', 'Grassland habitat'),
(4, 250.25, b'1', 'Small aquatic habitat'),
(5, 750.75, b'0', 'Forest enclosure');

SELECT * FROM Enclosure;


INSERT INTO `group-s09_db`.`Animal` (`species_id`, `animal_group`, `weight`, `enclosure_number`) VALUES
(1, 'Mammal', 220.75, 1),  -- Bengal Tiger
(2, 'Bird', 15.20, 2),     -- Golden Eagle
(5, 'Mammal', 540.00, 3),  -- African Elephant
(6, 'Mammal', 480.00, 1),  -- Polar Bear
(7, 'Reptile', 7.50, 4);   -- Green Iguana

SELECT * FROM Animal;


INSERT INTO `group-s09_db`.`Plant` (`species_id`, `plant_group`, `upright_yn`) VALUES
(3, 'Grass', b'1'),        -- Bamboo
(4, 'Succulent', b'0'),    -- Cactus
(8, 'Tree', b'1'),         -- Oak Tree
(9, 'Shrub', b'1'),        -- Rose Shrub
(10, 'Fern', b'0');        -- Maidenhair Fern

SELECT * FROM Plant;


INSERT INTO `group-s09_db`.`Study` (`study_id`, `study_title`, `study_desc`, `start_date`, `end_date`, `species_id`) 
VALUES
(1, 'Tiger Habitat Study', 'Study on Bengal Tiger habitat.', '2024-11-01', '2025-05-01', 1),
(2, 'Eagle Migration Tracking', 'Tracking migration patterns of Eagle.', '2024-09-01', '2024-11-01', 2),
(3, 'Bamboo Growth Analysis', 'Studying growth rate of Bamboo species.', '2024-08-01', '2025-01-01', 3),
(4, 'Cactus Water Retention Study', 'Researching water retention in Cactus.', '2024-07-15', '2024-12-15', 4),
(5, 'Elephant Conservation Project', 'Conservation efforts for African Elephants.', '2024-10-10', '2025-10-10', 5);

SELECT * FROM Study;


INSERT INTO `group-s09_db`.`Researcher` (`researcher_id`, `first_name`, `last_name`, `date_of_birth`, `study_id`, `supervisor_id`)
VALUES
(1, 'Alice', 'Smith', '1985-01-01', 1, NULL),
(2, 'Bob', 'Johnson', '1990-02-15', 2, 1),
(3, 'Carol', 'Williams', '1987-03-10', 3, 1),
(4, 'David', 'Brown', '1992-04-05', 4, 2),
(5, 'Eve', 'Davis', '1995-05-20', 5, 3);

SELECT * FROM Researcher;


