-- * Esercizi con JOIN
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`registration_number`, S.`name`, S.`surname`, DEG.`name` AS `course_name`
FROM `students` AS `S` 
JOIN `degrees` AS `DEG`
ON  S.`degree_id`= DEG.`id`
WHERE DEG.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEP.`name`, `DEG`.`name`
FROM `degrees` AS `DEG`
JOIN `departments` AS `DEP`
ON  DEG.`department_id` = DEP.`id`
WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT C.`name`, `T`.`id` 
FROM `courses` AS `C`
JOIN `course_teacher` AS `CT`
ON CT.`course_id` = C.`id`
JOIN `teachers` AS T 
ON CT.`teacher_id` = T.`id`
WHERE T.`surname` = 'Amato'
AND T.`name` = 'Fulvio';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`surname` AS `Cognome_studente`, s.`name` AS `Nome_studente`, s.registration_number  AS `#matricola`, DEG.`name`  AS `Corso_di_laurea`, DEP.`name`  AS `Dipartimento`
FROM `students` AS S
JOIN `degrees` AS DEG
ON `S`.`degree_id` = DEG.`id`
JOIN `departments` AS DEP
ON `DEG`.`department_id` = `DEP`.`id`
ORDER BY S.`surname` ASC, s.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DEG.`name` AS `Facoltà`, C.`name` AS `Corso`, T.`surname` AS `Professore`
FROM `degrees` AS DEG
JOIN `courses`AS C
ON C.`degree_id` = DEG.`id`
JOIN `course_teacher` AS CT
ON CT.`course_id` = C.`id`
JOIN `teachers` AS T
ON CT.`teacher_id` = T.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT DEP.`Nome_dipartimento`, T.`Cognome_professore`,  T.`id`
FROM `departments` AS DEP
JOIN `degrees` AS DEG
ON DEG.`department_id` = DEP.`id`
JOIN `courses`AS C
ON C.`degree_id` = DEG.`id`
JOIN `course_teacher` AS CT
ON CT.`course_id` = C.`id`
JOIN `teachers` AS T
ON CT.`teacher_id` = T.`id`
WHERE DEP.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT S.`fiscal_code`, S.`surname`, C.`name` AS `name_course`, COUNT(C.`id`) AS `tentativi_superamento_esame`, MAX(ES.`vote`) AS `voto_massimo`
FROM `exam_student` AS ES
JOIN `students` AS S
ON ES.`student_id` = `S`.`id`
JOIN `exams` AS E
ON `ES`.`exam_id` = `E`.`id`
JOIN `courses` AS C
ON `E`.`course_id` = `C`.`id`
GROUP BY C.`id`, S.`surname`, S.`fiscal_code`
HAVING `voto_massimo` >=18;
ORDER BY S.fiscal_code, S.surname ASC;