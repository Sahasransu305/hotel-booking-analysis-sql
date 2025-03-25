

-- Total Number of Bookings by Hotel Type
SELECT hotel, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;

-- Cancellation Rate by Hotel Type
SELECT hotel, COUNT(*) AS total_cancellations   
FROM hotel_booking_data_cleaned   
WHERE is_canceled = 1   
GROUP BY hotel;

-- Average Lead Time for Bookings
SELECT hotel, AVG(lead_time) AS avg_lead_time   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;

-- Top 5 Countries with Most Hotel Bookings
SELECT country, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
WHERE country IS NOT NULL   
GROUP BY country   
ORDER BY total_bookings DESC   
LIMIT 5;

-- Most Popular Meal Plans
SELECT meal, COUNT(*) AS meal_count   
FROM hotel_booking_data_cleaned   
GROUP BY meal   
ORDER BY meal_count DESC;

-- Room Type Booking vs. Assignment Mismatch
SELECT COUNT(*) AS mismatch_count   
FROM hotel_booking_data_cleaned   
WHERE reserved_room_type != assigned_room_type;

-- Market Segment with Highest Bookings
SELECT market_segment, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY market_segment   
ORDER BY total_bookings DESC;

-- Average Stay Duration for Guests
SELECT hotel, AVG(stays_in_week_nights + stays_in_weekend_nights) AS avg_stay_duration   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;

-- Year with the Highest Number of Bookings
SELECT arrival_date_year, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY arrival_date_year   
ORDER BY total_bookings DESC   
LIMIT 1;

