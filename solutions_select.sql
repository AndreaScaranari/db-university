-- * Esercizi con SELECT
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `registration_number`, `date_of_birth` FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name`, `period`, `year`, `cfu` FROM `courses` 
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `registration_number`, `date_of_birth`, `fiscal_code` FROM `students` 
WHERE YEAR(`date_of_birth`) < 1995 
AND MONTH(`date_of_birth`) < 3 
AND DAY(`date_of_birth`) < 2;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
-- laurea (286)
SELECT `degree_id`, `name`, `cfu` FROM `courses` 
WHERE `period` = "I semestre" 
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
-- 20/06/2020 (21)
SELECT * FROM `exams`
WHERE `hour` >= "14:00:00"
AND YEAR(`date`) = 2020
AND MONTH(`date`) = 06
AND DAY(`date`) = 20;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `department_id`, `name`, `address` FROM `degrees` 
WHERE `name` LIKE '%Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`ID`) AS `departments_in_uni` FROM `departments`;

-- # con visualizzazione grafica
SELECT `id`, `name` FROM `departments`
GROUP BY `id`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) AS `teachers_withouth_phone` FROM `teachers` WHERE `phone` <> '%';

-- # con visualizzazione grafica
SELECT `id`, `surname`, `email`, `office_number` FROM `teachers`
WHERE `phone` <> '%';
