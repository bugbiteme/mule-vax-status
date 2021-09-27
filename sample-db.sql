DROP TABLE IF EXISTS dose;
DROP TABLE IF EXISTS person;


CREATE TABLE `person` (
  `idp` int NOT NULL,
  `firstName` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`idp`),
  UNIQUE KEY `idp_UNIQUE` (`idp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_la_0900_ai_ci;

CREATE TABLE `dose` (
  `iddose` int NOT NULL AUTO_INCREMENT,
  `maker` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `doa` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `provider` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `lotNumber` varchar(45) COLLATE utf8mb4_la_0900_ai_ci DEFAULT NULL,
  `fk_idp` int DEFAULT NULL,
  PRIMARY KEY (`iddose`),
  KEY `fk_pid_idx` (`fk_idp`),
  CONSTRAINT `fk_idp` FOREIGN KEY (`fk_idp`) REFERENCES `person` (`idp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_la_0900_ai_ci;


INSERT INTO person (idp, firstName, lastName, dob)
VALUES (1, 'Jack', 'Sheppard', DATE '1992-05-18');

INSERT INTO dose (maker, doa, provider, lotNumber, fk_idp)
VALUES ( 
		'Pfizer', 
        '3/22/21', 
        'LAX', 
        '1234' , 
        (SELECT idp FROM person WHERE firstName= 'Jack' AND lastName= 'Sheppard')
);

INSERT INTO dose (maker, doa, provider, lotNumber, fk_idp)
VALUES ( 
		'Pfizer', 
        '4/19/21', 
        'WALGREENS', 
        '5678' , 
        (SELECT idp FROM person WHERE firstName= 'Jack' AND lastName= 'Sheppard')
);

INSERT INTO person (idp, firstName, lastName, dob)
VALUES (2, 'Aden', 'Episcopio', DATE '1994-09-11');

INSERT INTO dose (maker, doa, provider, lotNumber, fk_idp)
VALUES ( 
		'Johnson & Johnson', 
        '5/25/21', 
        'CVS', 
        '1234' , 
        (SELECT idp FROM person WHERE firstName= 'Aden' AND lastName= 'Episcopio')
);


INSERT INTO person (idp, firstName, lastName, dob)
VALUES (3, 'Max', 'Mule', DATE '1991-04-06');

INSERT INTO person (idp, firstName, lastName, dob)
VALUES (4, 'John', 'Talksalot', DATE '1981-10-25');

INSERT INTO dose (maker, doa, provider, lotNumber, fk_idp)
VALUES ( 
		'Moderna', 
        '4/19/21', 
        'WALGREENS', 
        '5678' , 
        (SELECT idp FROM person WHERE firstName= 'John' AND lastName= 'Talksalot')
);

SELECT * FROM person;

SELECT * FROM dose;

SELECT 
    person.idp, person.firstName, person.lastName, person.dob, dose.maker, dose.doa, dose.provider, dose.lotNumber
FROM 
    person
INNER JOIN 
    dose 
ON
    person.idp=dose.fk_idp
WHERE 
    person.firstName='Jack' AND person.lastName='Sheppard' AND person.dob='1992-05-18';