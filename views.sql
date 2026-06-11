CREATE VIEW city_revenue AS
SELECT s.city,
       SUM(cs.amount_paid) revenue
FROM charging_sessions cs
JOIN chargers c
ON cs.charger_id = c.charger_id
JOIN stations s
ON c.station_id = s.station_id
GROUP BY s.city;