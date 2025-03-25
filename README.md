# 📊 Hotel Booking Demand Analysis (SQL)

## 🚀 Overview  
This project analyzes a **hotel booking dataset** using **MySQL** to uncover key business insights. The dataset contains information on hotel reservations, customer demographics, booking details, and cancellations. The goal is to understand booking trends, cancellation patterns, and factors influencing hotel demand.  

---

## 📂 Dataset Overview  
The dataset consists of multiple rows and columns covering hotel bookings.  

### **Key Columns in the Dataset:**  
- **hotel** → Type of hotel (City Hotel or Resort Hotel)  
- **is_canceled** → Whether the booking was canceled (1 = Yes, 0 = No)  
- **lead_time** → Number of days before arrival the booking was made  
- **arrival_date_year, arrival_date_month, arrival_date_day** → Arrival date details  
- **stays_in_weekend_nights, stays_in_week_nights** → Number of nights stayed  
- **adults, children, babies** → Number of guests  
- **meal** → Type of meal plan booked  
- **country** → Country of origin of the guest  
- **market_segment** → Distribution channel (e.g., Direct, Corporate, Online TA)  
- **is_repeated_guest** → Whether the guest is a repeat visitor  
- **reserved_room_type, assigned_room_type** → Room types booked vs. assigned  
- **booking_changes** → Number of changes made to the booking  
- **deposit_type** → Type of deposit paid  
- **days_in_waiting_list** → Number of days the booking was on the waiting list  

---

## 📊 Steps Involved in Analysis  

### **1️⃣ Data Cleaning & Preparation in Microsoft Excel**  
- Removed duplicate records.  
- Handled missing values by replacing or removing them.  
- Standardized column names for better readability.  
- Converted dates into proper formats.  
- Extracted relevant numeric values for easier analysis.  

### **2️⃣ Data Exploration & Analysis (Using SQL)**  
The following SQL queries were used to derive business insights:  

#### ✅ **Total Number of Bookings by Hotel Type**  
```sql  
SELECT hotel, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;  
```
📌 Insight: Compares booking demand between city hotels and resort hotels.  

#### ✅ **Cancellation Rate by Hotel Type**  
```sql  
SELECT hotel, COUNT(*) AS total_cancellations   
FROM hotel_booking_data_cleaned   
WHERE is_canceled = 1   
GROUP BY hotel;  
```
📌 Insight: Shows which hotel type faces more cancellations.  

#### ✅ **Average Lead Time for Bookings**  
```sql  
SELECT hotel, AVG(lead_time) AS avg_lead_time   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;  
```
📌 Insight: Helps hotels plan resources based on advance booking trends.  

#### ✅ **Top 5 Countries with Most Hotel Bookings**  
```sql  
SELECT country, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
WHERE country IS NOT NULL   
GROUP BY country   
ORDER BY total_bookings DESC   
LIMIT 5;  
```
📌 Insight: Identifies the major customer source markets.  

#### ✅ **Most Popular Meal Plans**  
```sql  
SELECT meal, COUNT(*) AS meal_count   
FROM hotel_booking_data_cleaned   
GROUP BY meal   
ORDER BY meal_count DESC;  
```
📌 Insight: Helps hotels decide which meal plans to prioritize.  

#### ✅ **Room Type Booking vs. Assignment Mismatch**  
```sql  
SELECT COUNT(*) AS mismatch_count   
FROM hotel_booking_data_cleaned   
WHERE reserved_room_type != assigned_room_type;  
```
📌 Insight: Shows how often customers receive a different room than they booked.  

#### ✅ **Market Segment with Highest Bookings**  
```sql  
SELECT market_segment, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY market_segment   
ORDER BY total_bookings DESC;  
```
📌 Insight: Helps hotels understand the most valuable booking channels.  

#### ✅ **Average Stay Duration for Guests**  
```sql  
SELECT hotel, AVG(stays_in_week_nights + stays_in_weekend_nights) AS avg_stay_duration   
FROM hotel_booking_data_cleaned   
GROUP BY hotel;  
```
📌 Insight: Useful for hotel revenue management and pricing strategies.  

#### ✅ **Year with the Highest Number of Bookings**  
```sql  
SELECT arrival_date_year, COUNT(*) AS total_bookings   
FROM hotel_booking_data_cleaned   
GROUP BY arrival_date_year   
ORDER BY total_bookings DESC   
LIMIT 1;  
```
📌 Insight: Helps track booking growth trends over the years.  

---

## 📈 Key Insights & Business Impact  
📌 **City vs. Resort Hotel Demand**: City hotels have higher demand than resort hotels.  
📌 **Cancellation Rate Analysis**: Resort hotels face more cancellations compared to city hotels.  
📌 **Advance Booking Trends**: Average lead time for bookings is around 90 days.  
📌 **Major Customer Markets**: Most bookings originate from Europe and the USA.  
📌 **Most Popular Meal Plan**: "BB" (Bed & Breakfast) is the most chosen meal plan.  
📌 **Booking Channel Performance**: Online Travel Agents drive the majority of bookings.  
📌 **Room Type Mismatch**: 15% of bookings experience a mismatch in room assignment.  
📌 **Peak Booking Year**: 2018 recorded the highest number of bookings.  

These insights can help:  
✅ **Hotel Managers** optimize pricing and availability strategies.  
✅ **Marketing Teams** target promotions based on customer geography.  
✅ **Revenue Analysts** forecast demand based on past trends.  
✅ **Operations Teams** reduce booking cancellations and improve service.  
