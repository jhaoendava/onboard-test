SELECT user_id, sales_id, sales_amt, dt
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY user_id
               ORDER BY dt DESC, sales_id DESC
           ) AS rn
    FROM sales
) ranked
WHERE rn = 1;
