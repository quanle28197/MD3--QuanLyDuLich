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



