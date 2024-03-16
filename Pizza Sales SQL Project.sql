Create database Pizza_db;
use pizza_db;
select * from pizza_sales;

# KPI's

select round(sum(total_price), 2) from pizza_sales as Total_Revenue;

select round(sum(total_price)/count(distinct order_id), 2) as Average_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select round(sum(quantity)/ count(distinct order_id), 2) as Avg_Pizzas_Per_Order from pizza_sales;

# Charts

select dayname(order_date) as Order_Day, count(distinct order_id) as Total_Orders from pizza_sales group by dayname(order_date);

select monthname(order_date) as Month_Name, count(distinct order_id) as Total_orders from pizza_sales 
group by monthname(order_date)
order by Total_Orders desc;

select pizza_category, round(sum(total_price), 2) as Total_Sales, 
round(sum(total_price) * 100/ (select sum(total_price) from pizza_sales where month(order_date) = 3), 2) as PCT from pizza_sales 
where month(order_date) = 1
group by pizza_category;

select pizza_size, round(sum(total_price), 2) as Total_Sales, 
round(sum(total_price) * 100/ (select sum(total_price) from pizza_sales where quarter(order_date) = 1), 2) as PCT from pizza_sales
where quarter(order_date) = 1
group by pizza_size
order by pct;

select pizza_name, round(sum(total_price), 2) as Total_sales from pizza_sales 
group by pizza_name 
order by Total_Sales desc 
limit 5;

select pizza_name, round(sum(total_price), 2) as Total_sales from pizza_sales 
group by pizza_name 
order by Total_Sales 
limit 5;

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales 
group by pizza_name 
order by Total_quantity desc
limit 5;

select pizza_name, sum(quantity) as Total_Quantity from pizza_sales 
group by pizza_name 
order by Total_quantity 
limit 5;

select pizza_name, count(distinct order_id) as Total_Orders from pizza_sales 
group by pizza_name
order by Total_orders desc
limit 5;