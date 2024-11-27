create database Retail;
use Retail;

create table stores (
store_id int (10) primary key,
store_name varchar (100),
city varchar (100),
state varchar (100)
);

create table products ( 
product_id int (10),
product_name varchar (100),
category varchar (100),
supplier_id int (10),
price decimal (10,2)
);

create table suppliers (
supplier_id int (10),
supplier_name varchar (100),
contact varchar (100)
);

create table Inventory (
inventory_id int (10),
store_id int (10),
product_id int (10),
quantity int (10)
);

create table sales (
sales_id int (10),
store_id int (10),
product_id int (10),
quantity_sold int (10),
sale_date Date,
total_sales_amt Decimal (10,2)
);

create table customers (
customer_id int (10),
customer_name varchar (100),
email varchar(100)
);

create table customer_purchases (
purchase_id int(10),
customer_id int (10),
store_id int (10),
product_id int (10),
purchase_date date,
quantity int (10)
);
-------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS stores;

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100)
);

Alter table suppliers 
add primary key (supplier_id);

alter table suppliers
modify column contact int(10);

desc suppliers;

Drop table if exists products;
desc products;

create table products (
	product_id int Primary key,
    product_name varchar(100),
    category varchar(100),
    supplier_id int(10),
    foreign key (supplier_id) references suppliers (supplier_id)
    );
    
create table Inventory (
inventory_id int (10),
store_id int (10),
product_id int (10),
quantity int (10)
);

desc products;

alter table inventory
modify column inventory_id int Primary key,
add constraint store_id 
foreign key (store_id) references stores (store_id),
add constraint product_id 
foreign key (product_id) references products (product_id);
    
desc inventory;
desc sales;
desc stores;

alter table sales 
modify column sales_id int primary key,
add constraint fk_store_id 
foreign key (store_id) references stores (store_id),
add constraint fk_product_id 
foreign key (product_id) references products (product_id); 

commit;
desc sales;
desc customers;

alter table customers
modify customer_id int primary key;

truncate customer_purchases;
truncate sales;
truncate inventory;
desc inventory;
select * from inventory;
select * from customers;
Delete from customers;
Delete from stores;
Delete from products;
Delete from suppliers;
truncate stores;
truncate products;


alter table customer_purchases
modify purchase_id int primary key,
add constraint cust_id 
foreign key (customer_id) references customers (customer_id),
add constraint str_id 
foreign key (store_id) references stores (store_id);

alter table customer_purchases
add constraint prdct_id
foreign key (product_id) references products (product_id);    

desc stores;
desc products;
desc suppliers;
desc inventory;
desc sales;
desc customers;
desc customer_purchases;

alter table products
add column price decimal (10,2);

-----------------------------------------------------------------------------------------------------------------

INSERT INTO Stores (store_id, store_name, city, state) VALUES
(1, 'Mumbai Electronics', 'Mumbai', 'Maharashtra'),
(2, 'Delhi Digital', 'Delhi', 'Delhi'),
(3, 'Bangalore Tech', 'Bangalore', 'Karnataka'),
(4, 'Chennai Gadgets', 'Chennai', 'Tamil Nadu'),
(5, 'Kolkata Computers', 'Kolkata', 'West Bengal'),
(6, 'Hyderabad Hub', 'Hyderabad', 'Telangana'),
(7, 'Pune Phones', 'Pune', 'Maharashtra'),
(8, 'Ahmedabad Accessories', 'Ahmedabad', 'Gujarat'),
(9, 'Jaipur Devices', 'Jaipur', 'Rajasthan'),
(10, 'Lucknow Lights', 'Lucknow', 'Uttar Pradesh');

INSERT INTO Suppliers (supplier_id, supplier_name, contact) VALUES
(1, 'Global Tech Supplies', '+91-9876543210'),
(2, 'Universal Gadgets', '+91-9988776655'),
(3, 'Accessory Depot', '+91-9123456789'),
(4, 'Office Supplies Co.', '+91-9321654780'),
(5, 'Network Essentials', '+91-9102736451');

INSERT INTO Products (product_id, product_name, category, supplier_id, price) VALUES
(1, 'Smartphone', 'Electronics', 1, 15000),
(2, 'Laptop', 'Computers', 1, 50000),
(3, 'Tablet', 'Electronics', 2, 20000),
(4, 'Keyboard', 'Accessories', 3, 1000),
(5, 'Mouse', 'Accessories', 3, 500),
(6, 'Monitor', 'Electronics', 4, 8000),
(7, 'Printer', 'Office Supply', 4, 7000),
(8, 'Router', 'Networking', 5, 3000),
(9, 'Smartwatch', 'Electronics', 1, 12000),
(10, 'Headphones', 'Accessories', 2, 2000),
(11, 'Charger', 'Accessories', 5, 500),
(12, 'Speaker', 'Electronics', 1, 2500),
(13, 'USB Cable', 'Accessories', 3, 150),
(14, 'Power Bank', 'Accessories', 4, 1500),
(15, 'SSD Drive', 'Storage', 5, 6000),
(16, 'External HDD', 'Storage', 3, 4000),
(17, 'Webcam', 'Accessories', 4, 3000),
(18, 'Projector', 'Office Supply', 1, 10000),
(19, 'CPU', 'Computers', 5, 35000),
(20, 'Graphic Card', 'Computers', 2, 45000);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
(1, 'Rajesh Kumar', 'rajesh@example.com'),
(2, 'Anjali Sharma', 'anjali@example.com'),
(3, 'Vikram Singh', 'vikram@example.com'),
(4, 'Pooja Iyer', 'pooja@example.com'),
(5, 'Ravi Menon', 'ravi@example.com'),
(6, 'Neha Agarwal', 'neha@example.com'),
(7, 'Sneha Kapoor', 'sneha@example.com'),
(8, 'Alok Choudhary', 'alok@example.com'),
(9, 'Ankur Mehta', 'ankur@example.com'),
(10, 'Preeti Mishra', 'preeti@example.com');

INSERT INTO Inventory (inventory_id, store_id, product_id, quantity) VALUES
(1, 1, 1, 150),
(2, 2, 2, 80),
(3, 3, 3, 0),
(4, 4, 4, 120),
(5, 5, 5, 40),
(6, 6, 6, 30),
(7, 7, 7, 20),
(8, 8, 8, 200),
(9, 9, 9, 60),
(10, 10, 10, 10),
(11, 1, 11, 0),
(12, 2, 12, 130),
(13, 3, 13, 50),
(14, 4, 14, 100),
(15, 5, 15, 90),
(16, 6, 16, 0),
(17, 7, 17, 200),
(18, 8, 18, 70),
(19, 9, 19, 25),
(20, 10, 20, 75);

INSERT INTO Customer_Purchases (purchase_id, customer_id, store_id, product_id, purchase_date, quantity) VALUES
(1, 1, 1, 1, '2024-01-15', 10),
(2, 2, 2, 2, '2024-01-22', 5),
(3, 3, 3, 3, '2024-01-28', 2),
(4, 4, 4, 4, '2024-01-15', 15),
(5, 5, 5, 5, '2024-01-22', 10),
(6, 6, 6, 6, '2024-01-28', 8),
(7, 7, 7, 7, '2024-02-04', 20),
(8, 8, 8, 8, '2024-02-14', 15),
(9, 9, 9, 9, '2024-02-19', 5),
(10, 10, 10, 10, '2024-02-23', 1);

INSERT INTO Sales (sales_id, store_id, product_id, quantity_sold, sale_date, total_sales_amt) VALUES
(1, 1, 1, 100, '2024-01-15', 150000),
(2, 2, 2, 50, '2024-01-22', 250000),
(3, 3, 3, 20, '2024-01-28', 400000),
(4, 4, 4, 150, '2024-01-15', 150000),
(5, 5, 5, 100, '2024-01-22', 50000),
(6, 6, 6, 40, '2024-01-28', 320000),
(7, 7, 7, 200, '2024-02-04', 70000),
(8, 8, 8, 150, '2024-02-14', 450000),
(9, 9, 9, 30, '2024-02-19', 180000),
(10, 10, 10, 10, '2024-02-23', 20000);

desc sales;
select * from sales;
-- Adding to the existing Sales table (continuing from previous data)
INSERT INTO Sales (sales_id, store_id, product_id, quantity_sold, sale_date, total_sales_amt) VALUES
(11, 1, 2, 20, '2024-03-05', 100000),
(12, 2, 3, 15, '2024-03-12', 300000),
(13, 3, 4, 25, '2024-03-17', 25000),
(14, 4, 5, 50, '2024-03-20', 25000),
(15, 5, 6, 35, '2024-03-25', 280000),
(16, 6, 7, 45, '2024-03-29', 315000),
(17, 7, 8, 80, '2024-04-02', 240000),
(18, 8, 9, 60, '2024-04-08', 360000),
(19, 9, 10, 30, '2024-04-12', 60000),
(20, 10, 11, 15, '2024-04-18', 7500),
(21, 1, 12, 10, '2024-04-22', 25000),
(22, 2, 13, 50, '2024-04-25', 7500),
(23, 3, 14, 25, '2024-04-28', 37500),
(24, 4, 15, 40, '2024-05-01', 240000),
(25, 5, 16, 30, '2024-05-05', 120000),
(26, 6, 17, 15, '2024-05-10', 45000),
(27, 7, 18, 20, '2024-05-15', 200000),
(28, 8, 19, 10, '2024-05-20', 100000),
(29, 9, 20, 30, '2024-05-25', 135000),
(30, 10, 1, 50, '2024-06-02', 75000),
(31, 1, 2, 40, '2024-06-10', 200000),
(32, 2, 3, 15, '2024-06-15', 300000),
(33, 3, 4, 60, '2024-06-18', 60000),
(34, 4, 5, 100, '2024-06-22', 50000),
(35, 5, 6, 90, '2024-06-26', 720000),
(36, 6, 7, 150, '2024-06-29', 1050000),
(37, 7, 8, 200, '2024-07-03', 600000),
(38, 8, 9, 250, '2024-07-10', 750000),
(39, 9, 10, 20, '2024-07-15', 40000),
(40, 10, 11, 5, '2024-07-20', 2500),
(41, 1, 12, 60, '2024-08-01', 120000),
(42, 2, 13, 25, '2024-08-05', 125000),
(43, 3, 14, 45, '2024-08-10', 135000),
(44, 4, 15, 35, '2024-08-14', 70000),
(45, 5, 16, 30, '2024-08-20', 60000),
(46, 6, 17, 40, '2024-08-25', 160000),
(47, 7, 18, 70, '2024-09-01', 210000),
(48, 8, 19, 90, '2024-09-07', 180000),
(49, 9, 20, 25, '2024-09-12', 125000),
(50, 10, 1, 50, '2024-09-18', 50000),
(51, 1, 2, 40, '2024-09-22', 200000),
(52, 2, 3, 60, '2024-09-25', 180000),
(53, 3, 4, 55, '2024-10-01', 220000),
(54, 4, 5, 15, '2024-10-05', 30000),
(55, 5, 6, 30, '2024-10-10', 90000),
(56, 6, 7, 10, '2024-10-15', 50000),
(57, 7, 8, 90, '2024-10-20', 450000),
(58, 8, 9, 80, '2024-10-25', 80000),
(59, 9, 10, 60, '2024-11-02', 120000),
(60, 10, 11, 25, '2024-11-05', 5000),
(61, 1, 12, 20, '2024-11-08', 40000),
(62, 2, 13, 35, '2024-11-12', 70000),
(63, 3, 14, 40, '2024-11-16', 100000),
(64, 4, 15, 70, '2024-11-20', 420000),
(65, 5, 16, 25, '2024-11-25', 100000),
(66, 6, 17, 100, '2024-12-01', 150000),
(67, 7, 18, 60, '2024-12-05', 90000),
(68, 8, 19, 50, '2024-12-08', 250000),
(69, 9, 20, 45, '2024-12-15', 135000),
(70, 10, 1, 15, '2024-12-18', 30000),
(71, 1, 2, 40, '2025-01-02', 200000),
(72, 2, 3, 25, '2025-01-10', 125000),
(73, 3, 4, 50, '2025-01-14', 25000),
(74, 4, 5, 45, '2025-01-20', 225000),
(75, 5, 6, 70, '2025-01-25', 350000),
(76, 6, 7, 50, '2025-02-01', 150000),
(77, 7, 8, 25, '2025-02-05', 25000),
(78, 8, 9, 80, '2025-02-10', 400000),
(79, 9, 10, 35, '2025-02-14', 70000),
(80, 10, 11, 50, '2025-02-18', 25000),
(81, 1, 12, 20, '2025-02-22', 40000),
(82, 2, 13, 45, '2025-03-01', 90000),
(83, 3, 14, 60, '2025-03-05', 120000),
(84, 4, 15, 15, '2025-03-10', 30000),
(85, 5, 16, 30, '2025-03-15', 60000),
(86, 6, 17, 50, '2025-03-18', 200000),
(87, 7, 18, 20, '2025-03-22', 200000),
(88, 8, 19, 70, '2025-03-25', 350000),
(89, 9, 20, 40, '2025-03-28', 80000),
(90, 10, 1, 80, '2025-04-01', 40000),
(91, 1, 2, 40, '2025-04-05', 200000),
(92, 2, 3, 25, '2025-04-10', 25000);

use retail;
select * from customer_purchases;
select * from customers;
select * from inventory;
select * from products;
select * from sales;
select * from stores;
select * from suppliers;


/* Sales Performance Analysis
	a) Write a query to identify the top 3 stores with the highest total sales in the last year. */
select s.store_id, st.store_name, sum(s.total_sales_amt)  as total_sales 
from sales s
join stores st On st.store_id = s.store_id
where s.sale_date >= date_sub(curdate(), interval 1 year ) 
GROUP BY s.Store_id, st.store_name 
order by total_sales desc 
limit 3;
 /*
 b) •	Write a query to calculate the total sales for each store, 
 grouped by product categories, and display only stores where the total sales exceed 1000000 INR. */
 select * from products;
 select * from sales;
 select * from stores;
 select st.store_name, p.category as product_category, sum(s.total_sales_amt) as total_sales 
 from sales s 
 join stores st on  s.store_id = st.store_id
 join products p on s.product_id = p.product_id
 group by st.store_id, st.store_name, p.category
 having total_sales > 1000000
 order by total_sales desc
;
use retail;
 select * from products;
 -- C) Write a query to find products that are out of stock in more than 50% of the stores
 select  p.product_name as Out_of_stock, p.category, I.quantity 
 from Inventory I 
 join stores st on I.store_id = st.store_id
 join products p on I.product_id = p.product_id
 where I.quantity = 0
 group by  p.product_name, p.category, I.quantity ;
 
 -- Create a stored procedure for Items that are out of stock and use it to find stores that have those items in more than 100 quantity
 Delimiter //
 create procedure Outofstockproducts()
 Begin
 select p.product_name as product
 from Inventory I 
 join products p on I.product_id = p.product_id
 where I.quantity = 0;
 end // 	
 Delimiter ;

use retail;

 -- D) Write a query to analyze how many stores have more than 100 units of the product in stock and identify the product and store combinations
select i.store_id, st.store_name, p.product_name, i.quantity
from inventory i 
join products p on i.product_id = p.product_id
join stores st on i.store_id = i.store_id
where i.quantity > 100
group by i.store_id , st.store_name, p.product_name, i.quantity
;

select * from products;
select * from stores;
select * from inventory;
select * from customers;
select * from suppliers;
select * from sales;
select * from customer_purchases;

-- E) Write a query to identify the contribution of products amongst total sales.

  select supplier_id, count(product_name) from products group by supplier_id ;
  select product_id, quantity_sold, (quantity_sold / (select sum(quantity_sold) from sales)*100) as Sales_per 
  from sales 
  group by product_id, quantity_sold
  order by Sales_per desc;
  
  -- F) Write a query to identify suppliers whose products contribute to more than 20% of total sales across all stores.
  select * from products;
  select * from suppliers;
  select * from sales;
  select * from stores;
  
    select 
    ss.supplier_name, 
    count(p.product_id) as Product_count , 
    sum(s.quantity_sold) as Qty, 
    sum(s.total_sales_amt) as Sales, 
    sum(s.total_sales_amt * 100/ (select sum(total_sales_amt) from Sales)) as Sales_per
    from suppliers ss
    join products p on p.supplier_id = ss.supplier_id
    join sales s on s.product_id = p.product_id
    group by ss.supplier_name
    having Sales_per > 20
    limit 1000
    ;
  
  
  select * from products;
  select * from suppliers;
  select * from sales;
  select * from stores;
  --  G) Write a query to find the supplier whose products are sold at the most diverse stores
  select ss.supplier_name, count(distinct s.product_id) as Product_count, count(distinct s.store_id) as Store_count
  from suppliers ss
  join products p On ss.supplier_id = p.supplier_id
  join sales s On s.product_id = p.product_id
  group by ss.supplier_name
  order by Store_count desc 
  limit 1;
  
  -- H) Write a query to identify customers who have purchased from more than 3 stores in the last month.
  select * from customer_purchases;
  select * from customers;
  select * from stores;
  
  select c.Customer_id, c.Customer_name, count(distinct st.store_id) as Store_count
  from customers c
  join customer_purchases cp on c.customer_id = cp.customer_id
  join stores st on cp.store_id = st.store_id
  group by c.Customer_name, c.Customer_id
  having count(distinct cp.store_id) >3
  ;
  
-- I) Write a query to find customers who have spent more than $500 on a single purchase across all stores
  -- customer_purchase table lack a purchase_amt column to execute this query.
  
  select * from customer_purchases;
  select * from customers;
  select * from sales;
  select * from stores;
  select * from products;
  select * from inventory;
  use retail;
   
  
 /* J) Write a query to calculate the number of products that are projected to run out of stock within the next month 
     based on average sales for the past 3 months. 
	K) Write a query to recommend which products should be reordered first, based on the difference between 
     current stock levels and forecasted sales for the next 2 months. */
 -- I don't know how to find out forecasting
		