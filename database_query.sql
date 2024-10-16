-- 1. Selezionare tutti gli studenti nati nel 1990
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti
SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea
SELECT *
FROM `courses`
WHERE `period` = "I Semestre"
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020
SELECT *
FROM `exams`
WHERE `hour` > "14:00:00"
AND `date` = "2020/06/20";

-- 6. Selezionare tutti i corsi di laurea magistrale
SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- 7. Da quanti dipartimenti è composta l'università?
SELECT COUNT(`id`)
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT *
FROM `teachers`
WHERE `phone` IS NOT NULL;