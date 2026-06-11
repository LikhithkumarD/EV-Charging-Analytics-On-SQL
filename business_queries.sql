-- Revenue by City

SELECT s.city,
       SUM(cs.amount_paid) AS revenue
FROM charging_sessions cs
JOIN chargers c
ON cs.charger_id = c.charger_id
JOIN stations s
ON c.station_id = s.station_id
GROUP BY s.city
ORDER BY revenue DESC;

-- Top Customers

SELECT c.customer_name,
       SUM(cs.amount_paid) total_spent
FROM customers c
JOIN charging_sessions cs
ON c.customer_id = cs.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Peak Charging Hours

SELECT HOUR(start_time) charging_hour,
       COUNT(*) sessions
FROM charging_sessions
GROUP BY HOUR(start_time)
ORDER BY sessions DESC;

-- Most Used Chargers

SELECT charger_id,
       COUNT(*) usage_count
FROM charging_sessions
GROUP BY charger_id
ORDER BY usage_count DESC;