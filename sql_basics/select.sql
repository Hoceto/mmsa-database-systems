SELECT p.first_name, p.last_name,
COUNT(DISTINCT o.id) AS 'total_orders',
SUM(oi.quantity) AS 'total_items_bought',
SUM(oi.quantity * it.price - oi.discount) AS 'total_money_spent'
FROM person p
LEFT OUTER JOIN `order` o
ON (o.person_id=p.id)
LEFT OUTER JOIN order_item oi
ON (o.id = oi.order_id)
LEFT OUTER JOIN item it
ON (oi.item_id = it.id)
GROUP BY p.first_name;