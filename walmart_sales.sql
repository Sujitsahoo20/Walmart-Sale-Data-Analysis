use walmart;

create table sales (
invoice_id varchar(30) not null primary key,
branch varchar(5) not null, 
city varchar(50) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price decimal(10,2) not null,
quantity int not null,
VAT float(6,4) not null,
total decimal(12,4) not null,
date datetime not null,
time time not null,
payment_method varchar(15) not null,
cogs decimal(10,2) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,4) not null,
rating float(2,1)
);

select * from sales;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------Feature Engineering-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- time_of_day

SELECT time,
CASE
WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day
FROM sales;

ALTER TABLE sales Add column time_of_day varchar (20);

update sales 
SET time_of_day = (
CASE
WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
ELSE 'Evening'
END 
);


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------day_name-------------------------------------------------------------------------------------------------
select date,
dayname(date)
from sales;

alter table sales add column day_name varchar(10);

update sales
set day_name = dayname(date);


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------month_name-------------------------------------------------------------------------------------------------------------------

select date, monthname(date)
from sales;

alter table sales add column month_name varchar(10);

update sales
set month_name = monthname(date);





-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------Generic-----------------------------------------------------------------------------------------------------------------------

-- HOW MANY UNIQUE CITIES DOES THE DATA HAVE?

select distinct city from sales;

select distinct branch from sales;

-- In which city is each branch?
select distinct city, branch from sales;
