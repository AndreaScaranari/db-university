-- * Esercizi con GROUP BY
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS `year`, COUNT(`id`) AS `new_students` FROM `students` 
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(`id`) AS `teachers_in_same_address` FROM `teachers` 
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, ROUND(AVG(`vote`), 2) AS `average_vote` FROM `exam_student`
WHERE `vote` > 17
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(`id`) AS `degrees_in_department` FROM `degrees` 
GROUP BY `department_id`;