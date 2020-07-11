-- INSERTING DATA
INSERT INTO customer
VALUES
(1,'John', 'Doe', 'Hauptstrasse 1', '1030', 'Vienna', 'john@doe.com'),
(2,'Steve', 'Jobs', 'Nebenstrasse 20', '1230', 'Vienna', 'steve@jobs.com'),
(3,'Elon', 'Musk', 'Parkstrasse 13', '1010', 'Vienna', 'elon@musk.com'),
(4,'Jeff', 'Bezos', 'Schlossstrasse 5', '1040', 'Vienna', 'jeff@bezos.com'),
(5,'Warren ', 'Buffet', 'Allee 78', '1080', 'Vienna', 'warren@b.com'),
(6,'Oprah', 'Winfrey', 'Stadiongasse 77', '1110', 'Vienna', 'o@winfrey.com'),
(7,'Angelina', 'Jolie', 'Neuestarsse 12', '1070', 'Vienna', 'angi@jol.com'),
(8,'Sheldon', 'Cooper', 'Altestrasse 1', '1200', 'Vienna', 'dr@cooper.com'),
(9,'Tony', 'Stark', 'Bachgasse 99', '1140', 'Vienna', 'iron@man.com'),
(10,'Cameron', 'Diaz', 'Handelsgasse 43', '1150', 'Vienna', 'cam@diaz.com');

INSERT INTO sender
VALUES
(1001, "1"),
(1002, "2"),
(1003, "3"),
(1004, "4"),
(1005, "15");

INSERT INTO receiver
VALUES
(1001, "6"),
(1002, "7"),
(1003, "8"),
(1004, "9"),
(1005, "10");

INSERT INTO location
VALUES
(1, "Hausstrasse 10", "1010", "Vienna", "12345678"),
(2, "Aussenstrasse 102", "1230", "Vienna", "87654321"),
(3, "Superstrasse 3", "1120", "Vienna", "1111111"),
(4, "Neugasse 5", "1040", "Vienna", "44444444");

INSERT INTO package_type
VALUES
(1, "letter"),
(2, "small package 0kg < 1kg"),
(3, "normal package 1kg < 5kg"),
(4, "medium package 5kg < 10kg"),
(5, "large package 10kg < 50kg");

INSERT INTO head_quarter
VALUES
(1,"AUSTRIA","1"),
(2,"AUSTRIA","2"),
(3,"AUSTRIA","3"),
(4,"AUSTRIA","4");

INSERT INTO department
VALUES
(1, "Customer service"),
(2, "Processing System"),
(3, "Transport"),
(4, "Finance");

INSERT INTO employee
VALUES
(101, "Nico", "Schulz", "1", "1"),
(102, "Sandra", "Neugruber", "1", "2"),
(103, "Hannes", "Müller", "1", "3"),
(104, "Mario", "Neustaätter", "2", "2"),
(105, "Wolfgang", "Amadeus", "2", "1"),
(106, "Lisa", "Simpson", "2", "3"),
(107, "Homer", "Simpson", "3", "3"),
(108, "Howard", "Wolowitz", "3", "2"),
(109, "Maria", "Gruber", "3", "1");

INSERT INTO transport_type
VALUES
(1, "Motorcycle"),
(2, "Van"),
(3, "Train"),
(4, "Ship"),
(5, "Airplane"),
(6, "Local Pick-up");

INSERT INTO delivery
VALUES
(0001,'2020.07.20', '5', '103', '2', '1005'),
(0002,'2020.07.15', '1', '101', '1', '1001'),
(0003,'2020.08.21', '5', '102', '5', '1001'),
(0004,'2020.07.11', '2', '103', '6', '1002'),
(0005,'2020.10.20', '3', '108', '4', '1003');

INSERT INTO processing
VALUES
(1,"2020.07.10", "102","5"),
(1,"2020.06.30", "101","3"),
(1,"2020.07.14", "105","1");