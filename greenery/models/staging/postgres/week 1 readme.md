-- How many users do we have? 130

select count(distinct user_id) from stg_postgres_users;

-- On average, how many orders do we receive per hour? 7.68

select 
count(distinct order_id) / datediff('hour', min(created_at_utc), max(created_at_utc)) as numbers_of_hours_per_hour

from stg_postgres_orders;

-- On average, how long does an order take from being placed to being delivered? 3.288 days

select sum(datediff('days', created_at_utc, delivered_at_utc ))/count(distinct order_id)  as average_days_to_deliver 

from stg_postgres_orders
-- How many users have only made one purchase?  25
Two purchases? 28
Three+ purchases? 34

SELECT COUNT(DISTINCT USER_ID)
FROM (SELECT USER_ID,COUNT (DISTINCT ORDER_ID) AS NUM FROM STG_POSTGRES_ORDERS
GROUP BY 1) 
WHERE NUM = 1

SELECT COUNT(DISTINCT USER_ID)
FROM (SELECT USER_ID,COUNT (DISTINCT ORDER_ID) AS NUM FROM STG_POSTGRES_ORDERS
GROUP BY 1) 
WHERE NUM = 3

-- On average, how many unique sessions do we have per hour? 10.14
select 
count(distinct session_id) / datediff('hour', min(created_at_utc), max(created_at_utc)) as numbers_of_hours_per_hour

from stg_postgres_events;
