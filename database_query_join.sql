-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`id` AS `student_id`, `students`.`name` AS `first_name`, `students`.`surname` AS `last_name`, `degrees`.`name` AS `degree_course`, `degrees`.`level` AS `degree_level`
FROM `students`
JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`name` AS `degree_course`, `degrees`.`level` AS `degree_level`, `departments`.`name` AS `department`
FROM `degrees`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`level` = "Magistrale" AND `departments`.`name` = "Dipartimento di Neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id = 44)
SELECT `teachers`.`id` AS `teacher_id`, `teachers`.`name` AS `first_name`, `teachers`.`surname` AS `last_name`, `courses`.*
FROM `courses`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44;

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento,
in ordine alfabetico per cognome e nome */
SELECT `students`.`id` AS `student_id`, `students`.`name` AS `first_name`, `students`.`surname` AS `last_name`, `degrees`.`name` AS `degree_course`, `degrees`.`level` AS `degree_level`, `departments`.`name` AS `department`
FROM `students`
JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degree_course`, `degrees`.`level` AS `degree_level`, `courses`.`name` AS `course`, `courses`.`description`, `courses`.`period`, `courses`.`year`, `courses`.`cfu`, `teachers`.`id` AS `teacher_id`, `teachers`.`name` AS `first_name`, `teachers`.`surname` AS `last_name`
FROM `degrees`
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
SELECT DISTINCT `teachers`.`id` AS `teacher_id`, `teachers`.`name` AS `first_name`, `teachers`.`surname` AS `last_name`, `departments`.`name` AS `department`
FROM `teachers`
JOIN `course_teacher` ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses` ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

/* 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo.
Successivamente, filtrare i tentativi con voto minimo 18 */
SELECT `students`.`id` AS `student_id`, `students`.`name` AS `first_name`, `students`.`surname` AS `last_name`, `courses`.`name` AS `course`, COUNT(`exam_student`.`vote`) AS `attempts_number`, MAX(`exam_student`.`vote`) AS `maximum_vote`
FROM `students`
JOIN `exam_student` ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams` ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses` ON `courses`.`id` = `exams`.`course_id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `maximum_vote` >= 18;