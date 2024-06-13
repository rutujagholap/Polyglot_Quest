create database language_learning;

use language_learning;

create table user
(
    user_id int NOT NULL PRIMARY KEY,
    user_name varchar(100) NOT NULL,
    email varchar(100) NOT NULL 
);

create table language
(
    lang_id int NOT NULL PRIMARY KEY,
    lang_name varchar(100) UNIQUE KEY
);

create table user_lang
(
    user_lang_id int NOT NULL PRIMARY KEY,
    user_id int NOT NULL,
    lang_id int NOT NULL,
    CONSTRAINT `user_lang_fk1` FOREIGN KEY (`lang_id`) REFERENCES `language` (`lang_id`),
    CONSTRAINT `user_lang_fk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
);

create table score
(
    score_id int NOT NULL PRIMARY KEY,
    user_lang_id int NOT NULL,
    highest_score int NOT NULL,
    latest_score int NOT NULL,
    CONSTRAINT `score_fk1` FOREIGN KEY (`user_lang_id`) REFERENCES `user_lang` (`user_lang_id`)
);

create table word
(
    word_id int NOT NULL PRIMARY KEY,
    word_name varchar(100) NOT NULL UNIQUE KEY
);

create table translation
(
    trans_id int NOT NULL PRIMARY KEY,
    word_id int NOT NULL,
    lang_id int NOT NULL,
    translation_word varchar(250) NOT NULL,
    CONSTRAINT `translation_fk1` FOREIGN KEY (`word_id`) REFERENCES `word` (`word_id`),
    CONSTRAINT `translation_fk2` FOREIGN KEY (`lang_id`) REFERENCES `language` (`lang_id`)
);


-------------------------------------------------------DML SCRIPTS--------------------------------------------------------------------------

INSERT INTO language_learning.`language`
(lang_id, lang_name)
VALUES(1, 'Spanish');
INSERT INTO language_learning.`language`
(lang_id, lang_name)
VALUES(2, 'French');
INSERT INTO language_learning.`language`
(lang_id, lang_name)
VALUES(3, 'German');
INSERT INTO language_learning.`language`
(lang_id, lang_name)
VALUES(4, 'Portuguese');
INSERT INTO language_learning.`language`
(lang_id, lang_name)
VALUES(5, 'Arabic');


INSERT INTO language_learning.word
(word_id, word_name)
VALUES(1, 'Hello');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(2, 'Goodbye');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(3, 'Thank you');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(4, 'Please');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(5, 'Yes');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(6, 'No');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(7, 'Love');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(8, 'Friend');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(9, 'Family');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(10, 'Water');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(11, 'Food');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(12, 'Sun');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(13, 'Moon');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(14, 'Sky');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(15, 'Earth');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(16, 'Flower');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(17, 'Tree');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(18, 'Animal');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(19, 'Music');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(20, 'Book');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(21, 'Movie');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(22, 'Time');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(23, 'Day');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(24, 'Night');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(25, 'Happy');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(26, 'Sad');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(27, 'Beautiful');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(28, 'Strong');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(29, 'Brave');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(30, 'Small');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(31, 'Big');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(32, 'Old');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(33, 'New');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(34, 'Hot');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(35, 'Cold');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(36, 'Good');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(37, 'Bad');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(38, 'Fast');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(39, 'Peace');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(40, 'Nature');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(41, 'City');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(42, 'Ocean');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(43, 'Mountain');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(44, 'Travel');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(45, 'Adventure');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(46, 'Science');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(47, 'Technology');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(48, 'Peaceful');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(49, 'Creative');
INSERT INTO language_learning.word
(word_id, word_name)
VALUES(50, 'Joy');


INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(1, 1, 1, 'Hola');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(2, 2, 1, 'Adiós');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(3, 3, 1, 'Gracias');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(4, 4, 1, 'Por favor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(5, 5, 1, 'Sí');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(6, 6, 1, 'No');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(7, 7, 1, 'Amor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(8, 8, 1, 'Amigo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(9, 9, 1, 'Familia');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(10, 10, 1, 'Agua');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(11, 11, 1, 'Comida');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(12, 12, 1, 'Sol');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(13, 13, 1, 'Luna');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(14, 14, 1, 'Cielo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(15, 15, 1, 'Tierra');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(16, 16, 1, 'Flor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(17, 17, 1, 'Árbol');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(18, 18, 1, 'Animal');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(19, 19, 1, 'Música');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(20, 20, 1, 'Libro');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(21, 21, 1, 'Película');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(22, 22, 1, 'Tiempo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(23, 23, 1, 'Día');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(24, 24, 1, 'Noche');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(25, 25, 1, 'Feliz');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(26, 26, 1, 'Triste');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(27, 27, 1, 'Hermoso');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(28, 28, 1, 'Fuerte');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(29, 29, 1, 'Valiente');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(30, 30, 1, 'Pequeño');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(31, 31, 1, 'Grande');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(32, 32, 1, 'Viejo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(33, 33, 1, 'Nuevo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(34, 34, 1, 'Caliente');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(35, 35, 1, 'Frío');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(36, 36, 1, 'Bueno');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(37, 37, 1, 'Malo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(38, 38, 1, 'Rápido');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(39, 39, 1, 'Paz');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(40, 40, 1, 'Naturaleza');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(41, 41, 1, 'Ciudad');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(42, 42, 1, 'Océano');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(43, 43, 1, 'Montaña');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(44, 44, 1, 'Viajar');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(45, 45, 1, 'Aventura');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(46, 46, 1, 'Ciencia');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(47, 47, 1, 'Tecnología');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(48, 48, 1, 'Pacífico');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(49, 49, 1, 'Creativo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(50, 50, 1, 'Alegría');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(51, 1, 2, 'Bonjour');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(52, 2, 2, 'Au revoir');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(53, 3, 2, 'Merci');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(54, 4, 2, 'S''il vous plaît');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(55, 5, 2, 'Oui');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(56, 6, 2, 'Non');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(57, 7, 2, 'Amour');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(58, 8, 2, 'Ami');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(59, 9, 2, 'Famille');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(60, 10, 2, 'Eau');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(61, 11, 2, 'Nourriture');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(62, 12, 2, 'Soleil');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(63, 13, 2, 'Lune');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(64, 14, 2, 'Ciel');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(65, 15, 2, 'Terre');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(66, 16, 2, 'Fleur');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(67, 17, 2, 'Arbre');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(68, 18, 2, 'Animal');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(69, 19, 2, 'Musique');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(70, 20, 2, 'Livre');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(71, 21, 2, 'Film');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(72, 22, 2, 'Temps');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(73, 23, 2, 'Jour');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(74, 24, 2, 'Nuit');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(75, 25, 2, 'Heureux');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(76, 26, 2, 'Triste');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(77, 27, 2, 'Beau');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(78, 28, 2, 'Fort');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(79, 29, 2, 'Courageux');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(80, 30, 2, 'Petit');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(81, 31, 2, 'Grand');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(82, 32, 2, 'Vieux');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(83, 33, 2, 'Nouveau');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(84, 34, 2, 'Chaud');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(85, 35, 2, 'Froid');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(86, 36, 2, 'Bon');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(87, 37, 2, 'Mauvais');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(88, 38, 2, 'Rapide');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(89, 39, 2, 'Paix');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(90, 40, 2, 'Nature');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(91, 41, 2, 'Ville');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(92, 42, 2, 'Océan');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(93, 43, 2, 'Montagne');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(94, 44, 2, 'Voyager');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(95, 45, 2, 'Aventure');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(96, 46, 2, 'Science');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(97, 47, 2, 'Technologie');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(98, 48, 2, 'Paisible');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(99, 49, 2, 'Créatif');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(100, 50, 2, 'Joie');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(101, 1, 3, 'Hallo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(102, 2, 3, 'Auf Wiedersehen');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(103, 3, 3, 'Danke');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(104, 4, 3, 'Bitte');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(105, 5, 3, 'Ja');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(106, 6, 3, 'Nein	');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(107, 7, 3, 'Liebe');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(108, 8, 3, 'Freund');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(109, 9, 3, 'Familie');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(110, 10, 3, 'Wasser');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(111, 11, 3, 'Essen');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(112, 12, 3, 'Sonne');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(113, 13, 3, 'Mond');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(114, 14, 3, 'Himmel');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(115, 15, 3, 'Erde');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(116, 16, 3, 'Blume');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(117, 17, 3, 'Baum');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(118, 18, 3, 'Tier');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(119, 19, 3, 'Musik');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(120, 20, 3, 'Buch');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(121, 21, 3, 'Film');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(122, 22, 3, 'Zeit');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(123, 23, 3, 'Tag');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(124, 24, 3, 'Nacht');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(125, 25, 3, 'Glücklich');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(126, 26, 3, 'Traurig');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(127, 27, 3, 'Schön');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(128, 28, 3, 'Stark');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(129, 29, 3, 'Tapfer');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(130, 30, 3, 'Klein');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(131, 31, 3, 'Groß');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(132, 32, 3, 'Alt');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(133, 33, 3, 'Neu');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(134, 34, 3, 'Heiß');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(135, 35, 3, 'Kalt');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(136, 36, 3, 'Gut');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(137, 37, 3, 'Schlecht');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(138, 38, 3, 'Schnell');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(139, 39, 3, 'Frieden');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(140, 40, 3, 'Natur');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(141, 41, 3, 'Stadt');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(142, 42, 3, 'Ozean');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(143, 43, 3, 'Berg');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(144, 44, 3, 'Reisen');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(145, 45, 3, 'Abenteuer');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(146, 46, 3, 'Wissenschaft');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(147, 47, 3, 'Technologie');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(148, 48, 3, 'Friedlich');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(149, 49, 3, 'Kreativ');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(150, 50, 3, 'Freude');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(151, 1, 4, 'Olá');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(152, 2, 4, 'Adeus');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(153, 3, 4, 'Obrigado/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(154, 4, 4, 'Por favor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(155, 5, 4, 'Sim');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(156, 6, 4, 'Não');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(157, 7, 4, 'Amor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(158, 8, 4, 'Amigo/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(159, 9, 4, 'Família');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(160, 10, 4, 'Água');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(161, 11, 4, 'Comida');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(162, 12, 4, 'Sol');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(163, 13, 4, 'Lua');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(164, 14, 4, 'Céu');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(165, 15, 4, 'Terra');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(166, 16, 4, 'Flor');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(167, 17, 4, 'Árvore');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(168, 18, 4, 'Animal');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(169, 19, 4, 'Música');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(170, 20, 4, 'Livro');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(171, 21, 4, 'Filme');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(172, 22, 4, 'Tempo');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(173, 23, 4, 'Dia');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(174, 24, 4, 'Noite');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(175, 25, 4, 'Feliz');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(176, 26, 4, 'Triste');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(177, 27, 4, 'Bonito/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(178, 28, 4, 'Forte');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(179, 29, 4, 'Valente');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(180, 30, 4, 'Pequeno/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(181, 31, 4, 'Grande');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(182, 32, 4, 'Velho/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(183, 33, 4, 'Novo/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(184, 34, 4, 'Quente');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(185, 35, 4, 'Frio/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(186, 36, 4, 'Bom/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(187, 37, 4, 'Ruim/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(188, 38, 4, 'Rápido/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(189, 39, 4, 'Paz');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(190, 40, 4, 'Natureza');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(191, 41, 4, 'Cidade');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(192, 42, 4, 'Oceano');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(193, 43, 4, 'Montanha');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(194, 44, 4, 'Viajar');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(195, 45, 4, 'Aventura');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(196, 46, 4, 'Ciência');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(197, 47, 4, 'Tecnologia');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(198, 48, 4, 'Pacífico/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(199, 49, 4, 'Criativo/a');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(200, 50, 4, 'Alegria');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(201, 1, 5, 'مرحباً (Marhaban)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(202, 2, 5, 'وداعاً (Wada''an)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(203, 3, 5, 'شكراً (Shukran)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(204, 4, 5, 'من فضلك (Min fadlik)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(205, 5, 5, 'نعم (Naam)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(206, 6, 5, '	لا (La)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(207, 7, 5, 'حب (Hob)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(208, 8, 5, 'صديق (Sadeeq)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(209, 9, 5, '	عائلة (Aa''ila)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(210, 10, 5, 'ماء (Ma'')');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(211, 11, 5, 'طعام (Ta''am)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(212, 12, 5, 'شمس (Shams)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(213, 13, 5, '	قمر (Qamar)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(214, 14, 5, 'سماء (Samaa'')');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(215, 15, 5, 'أرض (Ard)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(216, 16, 5, 'زهرة (Zahra)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(217, 17, 5, 'شجرة (Shajara)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(218, 18, 5, 'حيوان (Haywan)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(219, 19, 5, 'موسيقى (Musiqaa)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(220, 20, 5, 'كتاب (Kitab)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(221, 21, 5, 'فيلم (Film)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(222, 22, 5, 'وقت (Waqt)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(223, 23, 5, 'يوم (Yawm)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(224, 24, 5, 'ليل (Layl)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(225, 25, 5, 'سعيد (Sa''id)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(226, 26, 5, 'حزين (Hazeen)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(227, 27, 5, 'جميل (Jameel)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(228, 28, 5, 'قوي (Qawi)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(229, 29, 5, 'شجاع (Shuja'')');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(230, 30, 5, 'صغير (Sagheer)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(231, 31, 5, 'كبير (Kabeer)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(232, 32, 5, 'قديم (Qadeem)
');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(233, 33, 5, 'جديد (Jadeed)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(234, 34, 5, 'حار (Har)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(235, 35, 5, 'بارد (Bard)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(236, 36, 5, 'جيد (Jayyid)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(237, 37, 5, '	سيء (Sayy)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(238, 38, 5, 'سريع (Saree'')');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(239, 39, 5, 'سلام (Salaam)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(240, 40, 5, 'طبيعة (Tabea''a)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(241, 41, 5, 'مدينة (Madinah)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(242, 42, 5, 'محيط (Muhit)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(243, 43, 5, 'جبل (Jabal)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(244, 44, 5, 'سفر (Safar)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(245, 45, 5, 'مغامرة (Mugamara)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(246, 46, 5, 'علم (Ilm)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(247, 47, 5, 'تكنولوجيا (Teknologia)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(248, 48, 5, 'سالم (Saleem)');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(249, 49, 5, 'مبدع (Mubdi'')');
INSERT INTO language_learning.`translation`
(trans_id, word_id, lang_id, translation_word)
VALUES(250, 50, 5, 'فرح (Farah)');