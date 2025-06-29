create database travel_agency;
use travel_agency;

select * from travel;

# 1. Find the total number of bookings.
select count(booking_id) as Total_Booking from travel;

# 2. Count how many bookings were cancelled.
select count(booking_id) as Total_Booking_Cancel from travel
where Cancellation_status = 'Yes';

# 3. Find the average ticket price by transport type.
select transport_type, round(avg(ticket_price),2) as avg_price from travel
group by transport_type
order by avg_price desc;

# 4. Get the top 5 most common destinations.
select destination, count(booking_id) as total_visits from travel
group by destination
order by total_visits desc limit 5;

# 5. Show total passengers carried by each transport type.
select Transport_type, sum(No_of_passengers) as total_passengers from travel
group by Transport_type
order by total_passengers desc;

select * from travel;

# 6. Find the average days booked in advance for each season.
select season, round(avg(Days_in_advance),2) as avg_days from travel
group by season;

# 7. Find the total ticket revenue for bookings where discount was applied.
select round(sum(ticket_price),0) as total_discounted_revenue from travel
where Discount_applied = 'Yes';

# 8. Get the booking channel with the highest number of cancellations.
select Booking_Channel, count(*) as Total_Cancel from travel
where Cancellation_status = 'Yes'
group by Booking_channel
order by Total_Cancel desc limit 1;

# 9. Get the most used payment method by desc order.
select Payment_type, count(*) as Total_Used from travel
group by Payment_type
order by Total_Used desc;
