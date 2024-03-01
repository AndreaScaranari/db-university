-- * Esercizi con GROUP BY
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS `year`, COUNT(`id`) AS `new_students` FROM `students` 
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(`id`) AS `teachers_in_same_address` FROM `teachers` 
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento