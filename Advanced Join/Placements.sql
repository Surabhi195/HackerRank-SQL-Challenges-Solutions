-- Author : Surabhi Karande
SELECT NAME
FROM   students S
       INNER JOIN friends F
               ON S.id = F.id
       INNER JOIN packages P
               ON S.id = P.id
       INNER JOIN packages P2
               ON F.friend_id = P2.id
WHERE  P.salary < P2.salary
ORDER  BY P2.salary;