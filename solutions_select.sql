-- * Esercizi con SELECT
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `registration_number`, `date_of_birth` FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- # alternativa (faster)
SELECT `name`, `surname`, `registration_number`, `date_of_birth` FROM `students`
WHERE `date_of_birth` LIKE '1990-%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `period`, `year`, `cfu` FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `registration_number`, `date_of_birth`, `fiscal_code` FROM `students` 
WHERE `date_of_birth` < '1994-03-02';

-- # con TIMESTAPDIFF
SELECT `name`, `surname`, `registration_number`, `date_of_birth`, `fiscal_code` FROM `students` 
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;

-- # alternativa (bruttina)
SELECT `name`, `surname`, `registration_number`, `date_of_birth`, `fiscal_code` FROM `students` 
WHERE DAY(`date_of_birth`) < 2 
AND MONTH(`date_of_birth`) < 3 
AND YEAR(`date_of_birth`) < 1994;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
-- laurea (286)
SELECT `degree_id`, `name`, `cfu` FROM `courses` 
WHERE `period` = "I semestre" 
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
-- 20/06/2020 (21)
SELECT * FROM `exams`
WHERE `date` = '2020-06-20'
AND HOUR(`hour`) >= '14';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `department_id`, `name`, `address` FROM `degrees` 
WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`ID`) AS `departments_in_uni` FROM `departments`;

-- # con visualizzazione grafica
SELECT `id`, `name` FROM `departments`
GROUP BY `id`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) AS `teachers_withouth_phone` FROM `teachers` 
-- WHERE `phone` IS NULL;