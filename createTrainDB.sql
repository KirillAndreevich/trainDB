DROP DATABASE IF EXISTS `dbmy`;
CREATE DATABASE `dbmy`;
USE `dbmy`;

CREATE TABLE station (
idStation INT(11) NOT NULL AUTO_INCREMENT,
stationName VARCHAR(50) NOT NULL,
PRIMARY KEY(idStation)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE car_type (
idType int(11) not null auto_increment,
valueOfPlace int(3) not null,
nameOfType varchar(10) not null,
price float not null,
PRIMARY KEY(idType)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE distance (
idStation1 INT(11) NOT NULL,
idStation2 INT(11) NOT NULL,
distance INT(5) NOT NULL,
price int(5) NOT NULL,
foreign key (idStation1) references station (idStation),
foreign key (idStation2) references station (idStation)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

#alter table train change cuntOfPlace countOfCar int(3) not null;

CREATE TABLE train (
idTrain INT(11) NOT NULL AUTO_INCREMENT,
countOfCar INT(3) NOT NULL,
idStation1 INT(11) NOT NULL,
idStation2 INT(11) NOT NULL,
PRIMARY KEY(idTrain),
foreign key (idStation1) references station (idStation),
foreign key (idStation2) references station (idStation)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE car (
idCar INT(11) NOT NULL AUTO_INCREMENT,
idTrain INT(11) NOT NULL,
carType int(11) NOT NULL,
carNumber int(10) NOT NULL,
PRIMARY KEY(idCar),
foreign key (idTrain) references train (idTrain),
foreign key (carType) references car_type (idType)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE passenger (
idPassenger INT(11) NOT NULL AUTO_INCREMENT,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
patronymic VARCHAR(50) NOT NULL,
PRIMARY KEY(idPassenger)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE route(
idRoute INT(11) NOT NULL auto_increment,
idTrain int(11) NOT NULL,
idStation1 int(11) not null,
idStation2 int(11) not null,
departure datetime not null,
arrival datetime not null,
primary key(idRoute),
foreign key (idTrain) references train (idTrain),
foreign key (idStation1) references station (idStation),
foreign key (idStation2) references station (idStation)
)engine=InnoDB default charset=utf8;

CREATE TABLE place(
idPlace INT(11) NOT NULL AUTO_INCREMENT,
idRoute int(11) not null,
idCar INT(11) NOT NULL,
numberOfPlace INT(3) NOT NULL,
conditionOfPlace varchar(10) NOT NULL,
PRIMARY KEY(idPlace),
foreign key (idRoute) references route (idRoute),
foreign key (idCar) references car (idCar)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE tiket (
idTiket INT(11) NOT NULL AUTO_INCREMENT,
idPlace INT(11) NOT NULL,
idCar INT(11) NOT NULL,
idRoute INT(11) NOT NULL,
idPassenger INT(11) NOT NULL,
PRIMARY KEY(idTiket),
FOREIGN KEY (idPlace) REFERENCES place (idPlace),
FOREIGN KEY (idCar) REFERENCES car (idCar),
FOREIGN KEY (idRoute) REFERENCES route (idRoute),
FOREIGN KEY (idPassenger) REFERENCES passenger (idPassenger)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

#CREATE TABLE direction ENGINE=INNODB DEFAULT CHARSET=utf8;
CREATE TABLE cach(
idTransaction int(11) not null auto_increment,
idTiket int(11) not null,
dateTymeTransaction datetime not null,
primary key(idTransaction),
foreign key (idTiket) references tiket (idTiket)
) engine=innodb default charset=utf8;

CREATE TABLE train_station (
idTrain int(11) not null,
idStation int(11) not null,
numberOfStation int(3) not null,
departureTime datetime not null,
arrivalTime  datetime not null,
foreign key  (idTrain) references train (idTrain),
foreign key (idStation) references station (idStation)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE markup (
idMarkup date not null,
valueOfMarkup float(5) default 0,
primary key (idMarkup)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

insert into station (stationName) values ('Новосибирск');
insert into station (stationName) values ('Омск');
insert into station (stationName) values ('Тюмень');
insert into station (stationName) values ('Красноярск');
insert into station (stationName) values ('Иркутск');
insert into station (stationName) values ('Улан-Удэ');
insert into station (stationName) values ('Чита');
insert into station (stationName) values ('Хабаровск');
insert into station (stationName) values ('Владивосток');


#update car_type set valueOfPlace = 3 where idType = 1 or idType = 3;
#update car_type set valueOfPlace = 2 where idType = 2;

insert into car_type (valueOfPlace,nameOfType,price) values (8,'Плацкарт',500);
insert into car_type (valueOfPlace,nameOfType,price) values (6,'Купе',1000);
insert into car_type (valueOfPlace,nameOfType,price) values (8,'Сидячий',100);

insert into distance (idStation1,idStation2,distance,price) values (1,2,600,500);
insert into distance (idStation1,idStation2,distance,price) values (1,3,1200,1000);
insert into distance (idStation1,idStation2,distance,price) values (1,4,600,500);
insert into distance (idStation1,idStation2,distance,price) values (1,5,1200,500);
insert into distance (idStation1,idStation2,distance,price) values (1,6,2000,500);
insert into distance (idStation1,idStation2,distance,price) values (1,7,2900,1000);
insert into distance (idStation1,idStation2,distance,price) values (1,8,5000,500);
insert into distance (idStation1,idStation2,distance,price) values (1,9,5800,500);
insert into distance (idStation1,idStation2,distance,price) values (2,1,600,500);
insert into distance (idStation1,idStation2,distance,price) values (3,1,1200,1000);
insert into distance (idStation1,idStation2,distance,price) values (4,1,600,500);
insert into distance (idStation1,idStation2,distance,price) values (5,1,1200,500);
insert into distance (idStation1,idStation2,distance,price) values (6,1,2000,500);
insert into distance (idStation1,idStation2,distance,price) values (7,1,2900,1000);
insert into distance (idStation1,idStation2,distance,price) values (8,1,5000,500);
insert into distance (idStation1,idStation2,distance,price) values (9,1,5800,500);

insert into train (countOfCar,idStation1,idStation2) values (244,1,4);
insert into train (countOfCar,idStation1,idStation2) values (132,1,8);
insert into train (countOfCar,idStation1,idStation2) values (212,1,7);
insert into train (countOfCar,idStation1,idStation2) values (85,5,1);
insert into train (countOfCar,idStation1,idStation2) values (62,9,1);
insert into train (countOfCar,idStation1,idStation2) values (114,2,1);
insert into train (countOfCar,idStation1,idStation2) values (119,2,1);





insert into car (idTrain, carType,carNumber) values (1,1,3);
insert into car (idTrain, carType,carNumber) values (1,3,2);
insert into car (idTrain, carType,carNumber) values (1,2,1);
insert into car (idTrain, carType,carNumber) values (2,1,3);
insert into car (idTrain, carType,carNumber) values (2,1,2);
insert into car (idTrain, carType,carNumber) values (2,2,1);
insert into car (idTrain, carType,carNumber) values (3,1,3);
insert into car (idTrain, carType,carNumber) values (3,1,2);
insert into car (idTrain, carType,carNumber) values (3,2,1);
insert into car (idTrain, carType,carNumber) values (4,3,3);
insert into car (idTrain, carType,carNumber) values (4,1,2);
insert into car (idTrain, carType,carNumber) values (4,2,1);
insert into car (idTrain, carType,carNumber) values (5,1,3);
insert into car (idTrain, carType,carNumber) values (5,3,2);
insert into car (idTrain, carType,carNumber) values (5,2,1);
insert into car (idTrain, carType,carNumber) values (6,1,3);
insert into car (idTrain, carType,carNumber) values (6,3,2);
insert into car (idTrain, carType,carNumber) values (6,2,1);
insert into car (idTrain, carType,carNumber) values (7,1,3);
insert into car (idTrain, carType,carNumber) values (7,1,2);
insert into car (idTrain, carType,carNumber) values (7,2,1);
insert into car (idTrain, carType,carNumber) values (1,2,1);
insert into car (idTrain, carType,carNumber) values (2,2,1);
insert into car (idTrain, carType,carNumber) values (3,2,1);


insert into passenger (firstName,lastName,patronymic) values ('Иван','Петрович','Сергеевич');
insert into passenger (firstName,lastName,patronymic) values ('Сергей','Нахимович','Андреевич');
insert into passenger (firstName,lastName,patronymic) values ('Роберт','Старк','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Владлен','Дарк','Ильич');
insert into passenger (firstName,lastName,patronymic) values ('Серафим','Мрак','Петрович');
insert into passenger (firstName,lastName,patronymic) values ('Платон','Осень','Надирович');
insert into passenger (firstName,lastName,patronymic) values ('Инга','Весна','Сергеевна');
insert into passenger (firstName,lastName,patronymic) values ('Юрий','Юркевич','Михайлович');
insert into passenger (firstName,lastName,patronymic) values ('Александр','Максаков','Евгеньевич');
insert into passenger (firstName,lastName,patronymic) values ('Игорь','Дюрьков','Максимович');
insert into passenger (firstName,lastName,patronymic) values ('Петр','Дроздов','Платонович');
insert into passenger (firstName,lastName,patronymic) values ('Сергей','Лебедь','Ильич');
insert into passenger (firstName,lastName,patronymic) values ('Даниил','Лето','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Константин','Зима','Надирович');
insert into passenger (firstName,lastName,patronymic) values ('Ольга','Цветок','Михайловна');
insert into passenger (firstName,lastName,patronymic) values ('Татьяна','Морж','Махмедова');
insert into passenger (firstName,lastName,patronymic) values ('Елена','Старикова','Платоновна');
insert into passenger (firstName,lastName,patronymic) values ('Максим','Муравьев','Петрович');
insert into passenger (firstName,lastName,patronymic) values ('Михаил','Путин','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Генадий','Хабенский','Максимович');
insert into passenger (firstName,lastName,patronymic) values ('Саруман','Старк','Кириллович');
insert into passenger (firstName,lastName,patronymic) values ('Полина','Гагарина','Евгеньевна');
insert into passenger (firstName,lastName,patronymic) values ('Екатерина','Мелешенко','Сергеевна');
insert into passenger (firstName,lastName,patronymic) values ('Сергей','Потанин','Михайлович');
insert into passenger (firstName,lastName,patronymic) values ('Але','Шевченко','Алексеевич');
insert into passenger (firstName,lastName,patronymic) values ('Владлен','Бондаренко','Кириллович');
insert into passenger (firstName,lastName,patronymic) values ('Екатерина','Стасюк','Кирилловна');
insert into passenger (firstName,lastName,patronymic) values ('Михаил','Старк','Максимович');
insert into passenger (firstName,lastName,patronymic) values ('Генадий','Старк','Платонович');
insert into passenger (firstName,lastName,patronymic) values ('Саруман','Бондаренко','Маркович');
insert into passenger (firstName,lastName,patronymic) values ('Максим','Старк','Ильич');
insert into passenger (firstName,lastName,patronymic) values ('Сергей','Богиня','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Елена','Бознова','Ильинична');
insert into passenger (firstName,lastName,patronymic) values ('Анастасия','Путь','Сергеевна');
insert into passenger (firstName,lastName,patronymic) values ('Евгений','Бондаренко','Мксимович');
insert into passenger (firstName,lastName,patronymic) values ('Альберт','Стасюк','Платонович');
insert into passenger (firstName,lastName,patronymic) values ('Варвара','Дождь','Евгеньевна');
insert into passenger (firstName,lastName,patronymic) values ('Птолемей','Бондаренко','Маркович');
insert into passenger (firstName,lastName,patronymic) values ('Платон','Старк','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Марк','Вадинов','Евгеньевич');
insert into passenger (firstName,lastName,patronymic) values ('Елена','Маркова','Ильинична');
insert into passenger (firstName,lastName,patronymic) values ('Анастасия','Макаревич','Сергеевна');
insert into passenger (firstName,lastName,patronymic) values ('Евгений','Сурьма','Мксимович');
insert into passenger (firstName,lastName,patronymic) values ('Альберт','Золотов','Платонович');
insert into passenger (firstName,lastName,patronymic) values ('Варвара','Домная','Евгеньевна');
insert into passenger (firstName,lastName,patronymic) values ('Птолемей','Стариков','Маркович');
insert into passenger (firstName,lastName,patronymic) values ('Платон','Плато','Валентинович');
insert into passenger (firstName,lastName,patronymic) values ('Марк','Ситцев','Евгеньевич');


insert into route(idTrain,idStation1,idStation2,departure,arrival) values (1,1,2,'2019-03-01 11:25:00','2019-03-02 15:25:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (2,6,2,'2019-03-05 21:25:00','2019-03-07 22:30:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (3,4,9,'2019-03-05 15:46:00','2019-03-08 6:30:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (4,1,2,'2019-03-29 21:25:00','2019-03-30 22:30:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (5,3,6,'2019-03-30 03:25:00','2019-04-01 17:30:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (6,1,9,'2019-03-27 14:55:00','2019-03-30 12:34:00');
insert into route(idTrain,idStation1,idStation2,departure,arrival) values (7,1,9,'2019-03-28 14:55:00','2019-03-30 12:34:00');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,1,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,1,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,1,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,2,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,2,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,2,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,3,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,3,2,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,4,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,4,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,4,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,5,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,5,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,5,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,6,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,6,2,'з');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,7,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,7,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,7,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,8,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,8,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,8,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,9,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,9,2,'з');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,10,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,10,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,10,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,11,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,11,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,11,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,12,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (4,12,2,'з');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,13,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,13,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,13,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,14,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,14,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,14,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,15,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (5,15,2,'з');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,16,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,16,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,16,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,17,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,17,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,17,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,18,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (6,18,2,'з');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,19,1,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,19,2,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,19,3,'с');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,20,1,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,20,2,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,20,3,'с');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,21,1,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (7,21,2,'с');


insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,22,1,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,22,2,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (1,22,3,'з');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,23,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,23,2,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (2,23,3,'с');

insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,24,1,'з');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,24,2,'с');
insert into place (idRoute,idCar,numberOfPlace,conditionOfPlace) values (3,24,3,'с');



insert into tiket(idPlace,idCar,idRoute,idPassenger) values (1,1,1,1);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (2,1,1,2);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (3,1,1,3);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (4,2,1,4);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (5,2,1,5);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (6,2,1,6);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (7,3,1,7);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (8,3,1,8);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (9,4,2,9);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (10,4,2,10);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (11,4,2,11);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (12,5,2,12);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (13,5,2,13);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (14,5,2,14);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (15,6,2,15);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (16,6,2,16);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (17,7,3,17);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (18,7,3,18);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (19,7,3,19);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (20,8,3,20);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (21,8,3,21);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (22,8,3,22);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (23,9,3,23);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (24,9,3,24);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (25,10,4,25);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (26,10,4,26);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (27,10,4,27);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (28,11,4,28);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (29,11,4,29);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (30,11,4,30);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (31,12,4,31);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (32,12,4,32);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (33,13,5,33);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (34,13,5,34);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (35,13,5,35);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (36,14,5,36);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (37,14,5,37);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (38,14,5,38);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (39,15,5,39);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (40,15,5,40);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (41,16,6,41);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (42,16,6,42);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (43,16,6,43);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (44,17,6,44);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (45,17,6,45);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (46,17,6,46);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (47,18,6,47);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (48,18,6,48);

insert into tiket(idPlace,idCar,idRoute,idPassenger) values (51,22,1,48);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (52,23,2,48);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (53,23,2,48);
insert into tiket(idPlace,idCar,idRoute,idPassenger) values (55,24,3,48);


insert into cach(idTiket,dateTymeTransaction) values (1,'2019-03-01 12:25:00');
insert into cach(idTiket,dateTymeTransaction) values (2,'2019-03-01 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (3,'2019-03-01 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (4,'2019-03-01 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (5,'2019-03-02 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (6,'2019-03-02 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (7,'2019-03-02 18:25:00');
insert into cach(idTiket,dateTymeTransaction) values (8,'2019-03-02 19:25:00');
insert into cach(idTiket,dateTymeTransaction) values (9,'2019-03-03 11:25:00');
insert into cach(idTiket,dateTymeTransaction) values (10,'2019-03-03 12:25:00');
insert into cach(idTiket,dateTymeTransaction) values (11,'2019-03-03 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (12,'2019-03-03 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (13,'2019-03-03 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (14,'2019-03-03 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (15,'2019-03-03 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (16,'2019-03-03 18:25:00');
insert into cach(idTiket,dateTymeTransaction) values (17,'2019-03-03 19:25:00');
insert into cach(idTiket,dateTymeTransaction) values (18,'2019-03-04 12:25:00');
insert into cach(idTiket,dateTymeTransaction) values (19,'2019-03-04 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (20,'2019-03-04 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (21,'2019-03-04 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (22,'2019-03-04 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (23,'2019-03-04 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (24,'2019-03-04 18:25:00');
insert into cach(idTiket,dateTymeTransaction) values (25,'2019-03-04 19:25:00');
insert into cach(idTiket,dateTymeTransaction) values (26,'2019-03-04 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (27,'2019-03-04 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (28,'2019-03-04 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (29,'2019-03-04 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (30,'2019-03-04 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (31,'2019-03-05 18:25:00');
insert into cach(idTiket,dateTymeTransaction) values (32,'2019-03-05 19:25:00');
insert into cach(idTiket,dateTymeTransaction) values (33,'2019-03-05 11:25:00');
insert into cach(idTiket,dateTymeTransaction) values (34,'2019-03-05 12:25:00');
insert into cach(idTiket,dateTymeTransaction) values (35,'2019-03-05 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (36,'2019-03-05 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (37,'2019-03-05 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (38,'2019-03-05 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (39,'2019-03-05 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (40,'2019-03-05 18:25:00');
insert into cach(idTiket,dateTymeTransaction) values (41,'2019-03-05 19:25:00');
insert into cach(idTiket,dateTymeTransaction) values (42,'2019-03-06 12:25:00');
insert into cach(idTiket,dateTymeTransaction) values (43,'2019-03-06 13:25:00');
insert into cach(idTiket,dateTymeTransaction) values (44,'2019-03-06 14:25:00');
insert into cach(idTiket,dateTymeTransaction) values (45,'2019-03-06 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (46,'2019-03-06 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (47,'2019-03-06 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (48,'2019-03-06 18:25:00');

insert into cach(idTiket,dateTymeTransaction) values (49,'2019-03-29 15:25:00');
insert into cach(idTiket,dateTymeTransaction) values (50,'2019-03-29 16:25:00');
insert into cach(idTiket,dateTymeTransaction) values (51,'2019-03-30 17:25:00');
insert into cach(idTiket,dateTymeTransaction) values (52,'2019-03-30 18:25:00');

insert into markup(idMarkup,valueOfMarkup) values ('2019-03-19',0);

#1
select firstName, lastName, patronymic from passenger where idPassenger in (
select idTiket from tiket where idRoute in (
select idRoute from route where departure between NOW() and date_add(NOW(), INTERVAL 1 day)
)
);
#2
select carNumber as 'Номер вагона' 
from car
inner join (select idCar, count(conditionOfPlace) as placeSvob from place where idRoute = (select idRoute from route where idTrain = (select idTrain from train where countOfCar = 119) and conditionOfPlace = 'с' limit 1)  group by idCar order by placeSvob desc limit 1) s on s.idCar = car.idCar;
#3
select TIMEDIFF(arrival, departure) as 'Время в пути' from route where idRoute = (select idRoute from tiket where idPassenger = (select idPassenger from passenger where firstName = 'Даниил' and lastName = 'Лето' and patronymic = 'Валентинович'));
#4
select sum(m.val * car_type.price) as Выручка
from car_type
right join (select t.idCar,t.val,car.carType from car right join (select idCar,count(idCar) as val from tiket as t where idTiket in (select idTiket from cach where dateTymeTransaction BETWEEN DATE_SUB(NOW(), INTERVAL 1 month) AND NOW()) group by idCar) t on car.idCar = t.idCar) m on m.carType = car_type.idType;
#5
select stationName as 'Популярные направления' from station where idStation in (
select idStation2 from route where idRoute in (
select idRoute from (select idRoute,count(idRoute) as t from tiket group by idRoute order by t desc limit 3) X
)
);
#6
insert into markup(idMarkup,valueOfMarkup) values('2019-03-12',1.15);




delimiter |
drop procedure if exists mon |
CREATE PROCEDURE `mon` (INOUT return_val INT)
BEGIN
	declare a,b int(10);
    declare money cursor for select sum(m.val * car_type.price) as Выручка
from car_type
right join (select t.idCar,t.val,car.carType from car right join (select idCar,count(idCar) as val from tiket as t where idTiket in (select idTiket from cach where dateTymeTransaction BETWEEN DATE_SUB(NOW(), INTERVAL 1 month) AND NOW()) group by idCar) t on car.idCar = t.idCar) m on m.carType = car_type.idType;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
    open money;

    REPEAT FETCH money INTO a;
	UNTIL b = 1 END REPEAT;

    close money;
    set return_val = a;
END;|
delimiter ;
call mon(@R);
select @R;





delimiter |
drop procedure if exists carNum |
CREATE PROCEDURE `carNum` (IN carNumber INT(3),out return_val INT(3))
BEGIN
	declare a,b int(3);
    declare carN cursor for select carNumber as 'Номер вагона' 
from car
inner join (select idCar, count(conditionOfPlace) as placeSvob from place where idRoute = (select idRoute from route where idTrain = (select idTrain from train where countOfCar = carNumber) and conditionOfPlace = 'с' limit 1)  group by idCar order by placeSvob desc limit 1) s on s.idCar = car.idCar;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
    open carN;

    REPEAT FETCH carN INTO a;
	UNTIL b = 1 END REPEAT;

    close carN;
    set return_val = a;
END;|
delimiter ;
call carNum(244,@T);
select @T;




DROP TRIGGER IF EXISTS `update_price`;
 
DELIMITER $$
CREATE TRIGGER `update_price`
AFTER UPDATE ON car_type
FOR EACH ROW
BEGIN
 
    UPDATE markup
 
    set NEW.idMarkup = (select curdate()), NEW.valueOfMarkup = (select valueOfMarkup from markup) + 1 where NEW.idMarkup;
 
END $$
DELIMITER ;
