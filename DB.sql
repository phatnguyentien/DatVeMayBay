CREATE SCHEMA `DatVeMayBay`; 
USE `DatVeMayBay`;

CREATE TABLE `User` (
  `ID` INT,
  `Username` CHAR(10) UNIQUE,
  `Password` CHAR(8),
  PRIMARY KEY (`ID`)
);

INSERT INTO `User` VALUES (1000, 'admin00000', 'admin111'),
							(1001, 'user000000', 'user1111');

CREATE TABLE `Direction` (
  `ID` INT,
  `Name` VARCHAR(40),
  PRIMARY KEY (`ID`)
);

INSERT INTO `Direction` VALUES (1000, 'One-way'), (1001, 'Two-way');

CREATE TABLE `Company` (
  `ID` INT,
  `Name` VARCHAR(40),
  PRIMARY KEY (`ID`)
);

INSERT INTO `Company` VALUES (1000, 'Vietnam Airline'), (1001, 'Vietjet Air');

CREATE TABLE `Rank` (
  `ID` INT,
  `Name` VARCHAR(40),
  PRIMARY KEY (`ID`)
);

INSERT INTO `Rank` VALUES (1000, 'Bussiness'), (1001, 'Normal');

CREATE TABLE `Flight` (
  `ID` INT AUTO_INCREMENT,
  `From` VARCHAR(40),
  `To` VARCHAR(40),
  `DateT` DATETIME,
  `Com_ID` INT,
  `Direct_ID` INT,
  `Rank_ID` INT,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Com_ID`) REFERENCES `Company`(`ID`),
  FOREIGN KEY (`Direct_ID`) REFERENCES `Direction`(`ID`),
  FOREIGN KEY (`Rank_ID`) REFERENCES `Rank`(`ID`)
);

INSERT INTO `Flight`(`From`, `To`, `DateT`, `Com_ID`, `Direct_ID`, `Rank_ID`) VALUES ('HCMC', 'Ha Noi', '2019-04-30 07:00:00', 1000, 1001, 1000),
							('HCMC', 'Da Nang', '2019-04-30 08:00:00', 1000, 1000, 1001),
							('HCMC', 'Hai Phong', '2019-05-01 09:00:00', 1001, 1000, 1000),
							('HCMC', 'Ca Mau', '2019-05-01  10:00:00', 1001, 1000, 1001);

CREATE TABLE `Ticket` (
  `ID` INT AUTO_INCREMENT,
  `Code` INT UNIQUE,
  `User_ID` INT,
  `Flight_ID` INT,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `User`(`ID`),
  FOREIGN KEY (`Flight_ID`) REFERENCES `Flight`(`ID`)
);

INSERT INTO `Ticket`(`Code`, `User_ID`, `Flight_ID`) VALUES (1, 1001, 1);
