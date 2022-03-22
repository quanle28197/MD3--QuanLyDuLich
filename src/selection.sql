-- Thống kê số lượng tour của các thành phố
select name_city,count(td.id_city) as tour_number from City
join destination td on City.id_city = td.id_city  group by name_city;


-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020
SELECT COUNT(month(start_date)) as soluong FROM tour
WHERE month(start_date) = 3 AND year(start_date) = 2021;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
SELECT COUNT(month(end_date)) as soluong FROM tour
WHERE month(end_date) = 4 AND year(start_date) = 2021;