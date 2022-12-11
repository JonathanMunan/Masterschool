-- Practice SQL query on a Udacity dataset

SELECT AVG(total)
FROM
 (SELECT a.name AS account,
         SUM(o.total_amt_usd) AS total
    FROM accounts AS a
    JOIN orders AS o
      ON a.id = o.account_id
  GROUP BY 1
  HAVING SUM(o.total_amt_usd) >
   (SELECT AVG(total)
     FROM
      (SELECT a.name AS account,
              SUM(o.total_amt_usd) AS total
         FROM accounts AS a
         JOIN orders AS o
           ON a.id = o.account_id
      GROUP BY 1
      ORDER BY 2 DESC) AS t1)) AS t2;