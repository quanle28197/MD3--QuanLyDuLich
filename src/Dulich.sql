CREATE DATABASE TourDuLich2;
USE TourDuLich2;

CREATE TABLE destination (
                             id_destination INT AUTO_INCREMENT PRIMARY KEY,
                             name_destination VARCHAR(50) NOT NULL,
                             description varchar(255) not NULL,
                             avg_price DOUBLE not NULL,
                             id_city INT not NULL,
                             FOREIGN KEY (id_city) REFERENCES City(id_city)
);

CREATE TABLE customer (
                          id_customer INT AUTO_INCREMENT PRIMARY KEY,
                          name_customer VARCHAR(50) not NULL,
                          customer_cmt VARCHAR(50) NOT NULL,
                          year_of_birth date not null,
                          id_city INT not NULL,
                          FOREIGN KEY (id_city) REFERENCES City(id_city)
);

CREATE TABLE City (
                      id_city int AUTO_INCREMENT PRIMARY KEY,
                      name_city VARCHAR(50) not NULL
);

create table tour (
                      id_tour INT AUTO_INCREMENT PRIMARY key,
                      tour_code INT NOT null,
                      id_type_tour INT NOT null,
                      destination_price DOUBLE not null,
                      start_date DATE not null,
                      end_date DATE not null,
                      FOREIGN KEY (id_type_tour) REFERENCES typeTour(id_type_tour)
);



CREATE TABLE typeTour(
                         id_type_tour INT AUTO_INCREMENT PRIMARY KEY,
                         type_code INT NOT NULL ,
                         type_name VARCHAR(60)
);

CREATE TABLE tourBookingInvoice (
                                    id_invoice INT AUTO_INCREMENT PRIMARY KEY,
                                    id_tour_table INT,
                                    id_Customers INT,
                                    status_customers INT DEFAULT 1 CHECK ( status_customers = 1 or status_customers - 0 ),
                                    FOREIGN KEY (id_Customers) REFERENCES customer(id_customer)
);

ALTER TABLE tour
    add id_destination int,
    add FOREIGN KEY (id_destination) REFERENCES destination(id_destination);

INSERT INTO City (name_city) VALUES
                                 ('Ha Long'),
                                 ('Hai Phong'),
                                 ('Sa Pa'),
                                 ('Ha Noi'),
                                 ('Sai Gon');

INSERT INTO typeTour VALUES (1, 0991, 'Du lich cam trai'),
                            (2, 0992, 'Du lich huong thu');

INSERT INTO customer VALUES  (1, 'Le Quan', 013445606, '1996-08-03', 1),
                             (2, 'Le Hoang',013445909, '1997-07-02',1),
                             (3, 'Le Kim Chi',013445909, '1992-07-02',2),
                             (4, 'Trinh Hoai Duc',013445909, '1991-07-02',2),
                             (5, 'Vu Thien Thanh',013445909, '1994-07-02',3),
                             (6, 'Mai Hoang',013445909, '1989-07-02',3),
                             (7, 'Duc Trung',013445909, '1987-07-02',4),
                             (8, 'Hoang Duc',013445909, '1912-07-02',4),
                             (9, 'Hoang Mai',013445909, '1999-07-02',5),
                             (10, 'Kim Thu',013445909, '2000-07-02',5);

INSERT INTO destination VALUES (1, 'Ha long', 'thich thi di du lich', 20000, 1),
                               (2, 'Hai Phong', 'thanh pho hoa phuong do', 30000, 2),
                               (3, 'Sapa', 'thanh pho suong mu', 15000, 3),
                               (4, 'Ha Noi', 'thu do nghin nam van vo',30000, 4),
                               (5, 'Sai Gon', 'thanh pho khong ngu',40000, 5);

INSERT INTO tour(tour_code, id_type_tour, destination_price, start_date, end_date) VALUE
    (1, 1, 3000000, '2021-11-02', '2021-11-04'),
    (2, 2, 1500000, '2021-12-12', '2021-12-13'),
    (3, 2, 1100000, '2021-01-14', '2021-01-15'),
    (4, 1, 3300000, '2021-03-22', '2021-03-24'),
    (5, 2, 1400000, '2021-04-02', '2021-04-04'),
    (6, 1, 1500000, '2021-04-13', '2021-11-14'),
    (7, 1, 2000000, '2021-06-21', '2021-06-22'),
    (8, 2, 1700000, '2021-07-15', '2021-11-16'),
    (9, 1, 2100000, '2021-02-11', '2021-02-13'),
    (10, 1, 3800000, '2021-09-25', '2021-09-27'),
    (11, 2, 2400000, '2021-01-22', '2021-01-23'),
    (12, 1, 3000000, '2021-05-02', '2021-05-04'),
    (13, 2, 1100000, '2021-03-11', '2021-03-12'),
    (14, 2, 2500000, '2021-10-17', '2021-10-18'),
    (15, 1, 2100000, '2021-03-17', '2021-03-19');

INSERT INTO tourBookingInvoice (id_tour_table, id_Customers, status_customers) VALUES
                                                                                   (1, 6, 1),
                                                                                   (3, 2, 1),
                                                                                   (4, 5, 1),
                                                                                   (11, 7, 1),
                                                                                   (10, 8, 1),
                                                                                   (14, 1, 1),
                                                                                   (12, 10, 1),
                                                                                   (6, 4, 1),
                                                                                   (9, 6, 1),
                                                                                   (7, 1, 1);

-- Thống kê số lượng tour của các thành phố
select name_city,count(td.id_city) as tour_number from City
join destination td on City.id_city = td.id_city  group by name_city;


-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020
SELECT COUNT(month(start_date)) as soluong FROM tour
WHERE month(start_date) = 3 AND year(start_date) = 2021;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
SELECT COUNT(month(end_date)) as soluong FROM tour
WHERE month(end_date) = 4 AND year(start_date) = 2021;
