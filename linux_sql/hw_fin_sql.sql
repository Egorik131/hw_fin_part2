DROP DATABASE IF EXISTS Human_Friends;
CREATE DATABASE Human_Friends;
use Human_Friends;

DROP TABLE IF EXISTS Animals;
CREATE TABLE Animals (
id INT PRIMARY KEY AUTO_INCREMENT,
type_animals VARCHAR(15));
 
INSERT INTO 
    Animals (type_animals)
VALUES
    ("Pets"),
	("Pack_animals");

DROP TABLE IF EXISTS Pets;
CREATE TABLE Pets (
id INT PRIMARY KEY AUTO_INCREMENT,
animal VARCHAR(15),
type_animals VARCHAR(15));
 
INSERT INTO 
    Pets (animal, type_animals)
VALUES
    ("cats", "Pets"),
	("dogs", "Pets"),
    ("hamsters", "Pets");


DROP TABLE IF EXISTS Pack_animals;
CREATE TABLE Pack_animals (
id INT PRIMARY KEY AUTO_INCREMENT,
animal VARCHAR(15),
type_animals VARCHAR(15));
 
INSERT INTO 
    Pack_animals (animal, type_animals)
VALUES
    ("horses", "Pack_animals"),
	("camels", "Pack_animals"),
    ("donkeys", "Pack_animals");


DROP TABLE IF EXISTS Cats;
CREATE TABLE Cats (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Cats (Name, Type, BirthDate, Commands, animal)
VALUES
    ("mursik", "cat", "2022-02-02", "Sit, Pounce", "cats"),
	("belyi", "cat", "2021-03-08", "Sit, Pounce", "cats"),
    ("pushok", "cat", "2019-01-01", "Sit, Pounce", "cats"),
    ("kisa", "cat", "2023-05-02", "Sit, Pounce", "cats");

DROP TABLE IF EXISTS Dogs;
CREATE TABLE Dogs (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Dogs (Name, Type, BirthDate, Commands, animal)
VALUES
	("tobik", "dog", "2020-08-03", "Sit, Paw, Bark", "dogs"),
    ("bobik", "dog", "2022-01-03", "Sit, Paw, Bark", "dogs"),
    ("belka", "dog", "2022-10-03", "Sit, Paw, Bark", "dogs"),
    ("tusik", "dog", "2021-12-04", "Sit, Paw, Bark", "dogs");
 
DROP TABLE IF EXISTS Hamsters;
CREATE TABLE Hamsters (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Hamsters (Name, Type, BirthDate, Commands, animal)
VALUES
    ("buddy", "hamster", "2020-03-01", "Roll, Hide", "hamsters"),
    ("piskun", "hamster", "2021-02-03", "Roll, Hide", "hamsters"),
    ("hams", "hamster", "2022-05-04", "Roll, Hide", "hamsters"),
    ("bud", "hamster", "2023-06-05", "Roll, Hide", "hamsters");

DROP TABLE IF EXISTS Horses;
CREATE TABLE Horses (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Horses (Name, Type, BirthDate, Commands, animal)
VALUES
    ("bisriy", "horse", "2020-05-06", "Trot, Canter, Gallop", "horses"),
	("seriy", "horse", "2020-05-06", "Trot, Canter, Gallop", "horses"),
    ("start", "horse", "2020-05-06", "Trot, Canter, Gallop", "horses"),
    ("strela", "horse", "2022-07-08", "Trot, Canter, Gallop", "horses");
    
DROP TABLE IF EXISTS Camels;
CREATE TABLE Camels (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Camels (Name, Type, BirthDate, Commands, animal)
VALUES
     ("sunny", "camel", "2019-01-07", "Walk, Carry Load", "camels"),
     ("winny", "camel", "2018-05-07", "Walk, Carry Load", "camels"),
     ("dori", "camel", "2020-06-17", "Walk, Carry Load", "camels"),
     ("cam", "camel", "2019-08-05", "Walk, Carry Load", "camels");
    
DROP TABLE IF EXISTS Donkeys;
CREATE TABLE Donkeys (
ID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(15),
Type VARCHAR(15),
BirthDate Date,
Commands VARCHAR(30),
animal VARCHAR(15));
 
INSERT INTO 
    Donkeys (Name, Type, BirthDate, Commands, animal)
VALUES
    ("ia", "donkey", "2018-07-04", "Walk, Carry Load, Bray", "donkeys"),
    ("ishak", "donkey", "2020-10-01", "Walk, Carry Load, Bray", "donkeys"),
    ("dolgiy", "donkey", "2022-05-20", "Walk, Carry Load, Bray", "donkeys"),
    ("grust", "donkey", "2019-04-05", "Walk, Carry Load, Bray", "donkeys");

-- task 10

DELETE FROM Camels WHERE id > 0;
SELECT * FROM Camels;

-- далее все таблицы без верблюдов, т.к. они перехалиaли

DROP TABLE IF EXISTS New_Pack_Animals;
CREATE TABLE New_Pack_Animals AS 
(SELECT * FROM Horses
UNION
-- SELECT * FROM Camels
-- UNION
SELECT * FROM Donkeys);
SELECT * FROM New_Pack_Animals;

-- task 12
DROP TABLE IF EXISTS All_Animals;
CREATE TABLE All_Animals AS 
(SELECT * FROM Cats
UNION
SELECT * FROM Dogs
UNION
SELECT * FROM Hamsters
UNION
SELECT * FROM Horses
UNION
SELECT * FROM Camels
UNION
SELECT * FROM Donkeys);
SELECT * FROM All_Animals;


-- task11
DROP TABLE IF EXISTS young_animals;
CREATE TABLE young_animals AS 
(WITH age as (SELECT id, Name, Type, BirthDate, Commands, TIMESTAMPDIFF(MONTH, BirthDate, CURRENT_DATE()) AS age_in_month FROM All_Animals)
SELECT * FROM age WHERE age_in_month BETWEEN 12 and 36);
SELECT * FROM young_animals;
    