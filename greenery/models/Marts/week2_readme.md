with orders as 
(select user_id,count(distinct order_id) as num from stg_postgres_orders
group by 1),

repeats as (select * from orders where num>=2)

select count(distinct b.user_id)/count(distinct a.user_id) 
from orders a 
left join repeats b on a.user_id=b.user_id


-- What are good indicators of a user who will likely purchase again? 

High Customer Satisfaction Rating, High Repeated Order Rate, Low Return rate, Low Time Between Purchases

What about indicators of users who are likely NOT to purchase again? 

Low High Customer Satisfaction Rating, High Return Rate, Low Number of Sessions  

If you had more data, what features would you want to look into to answer this question?

Satisfaction and return orders



--- part 3
order b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f,e42ba9a9-986a-4f00-8dd2-5cf8462c74ea,265f9aae-561a-4232-a78a-7052466e46b7