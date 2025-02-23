--Data Analysis using SQL Queries

--Top pickup locations based on no. of trips
SELECT 
    p.pickup_location_id, 
    COUNT(f.trip_id) AS trip_count
FROM `careful-analyst-451322-v9.uber_dataset.fact_table` f
JOIN `careful-analyst-451322-v9.uber_dataset.pickup_location_dim` p 
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY p.pickup_location_id
ORDER BY trip_count DESC;

--Total no. of trips by passanger count
SELECT 
    p.passenger_count, 
    COUNT(f.trip_id) AS total_trips
FROM `careful-analyst-451322-v9.uber_dataset.fact_table` f
JOIN `careful-analyst-451322-v9.uber_dataset.passenger_count_dim` p 
    ON f.passenger_count_id = p.passenger_count_id
GROUP BY p.passenger_count
ORDER BY p.passenger_count;

--Average fare amount by hour of the day
SELECT 
    d.pick_hour, 
    AVG(f.fare_amount) AS avg_fare
FROM `careful-analyst-451322-v9.uber_dataset.fact_table` f
JOIN `careful-analyst-451322-v9.uber_dataset.datetime_dim` d 
    ON f.datetime_id = d.datetime_id
GROUP BY d.pick_hour
ORDER BY d.pick_hour;

--avg tip amount by payment type
SELECT 
    p.payment_type_name, 
    AVG(f.tip_amount) AS avg_tip
FROM `careful-analyst-451322-v9.uber_dataset.fact_table` f
JOIN `careful-analyst-451322-v9.uber_dataset.payment_type_dim` p 
    ON f.payment_type_id = p.payment_type_id
GROUP BY p.payment_type_name
ORDER BY p.payment_type_name;

