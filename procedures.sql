DELIMITER //

CREATE PROCEDURE TopCustomers()
BEGIN

SELECT c.customer_name,
       SUM(cs.amount_paid) total_spent
FROM customers c
JOIN charging_sessions cs
ON c.customer_id = cs.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

END //

DELIMITER ;