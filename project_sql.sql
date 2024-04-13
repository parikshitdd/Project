SELECT 
    t1.item_id,
    t1.item_name,
    t3.customer_id,
    NVL(SUM(t2.quantity), 0) AS quantity
FROM 
    e_items t1
JOIN 
    e_ordes t2 ON t1.item_id = t2.item_id
JOIN 
    e_sales t3 ON t2.sales_id = t3.sales_id
JOIN 
    e_customer t4 ON t3.customer_id = t4.customer_id
WHERE 
    t4.age BETWEEN 18 AND 35
GROUP BY 
    t1.item_id, t1.item_name, t3.customer_id, t4.age
HAVING 
    NVL(SUM(t2.quantity), 0) > 0
    order by t1.item_id desc;
