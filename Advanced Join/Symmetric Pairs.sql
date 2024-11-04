-- Author : Surabhi Karande
SELECT x1,
       y1
FROM   ((SELECT F.x AS X1,
                F.y AS Y1
         FROM   functions F
                INNER JOIN functions F2
                        ON F.x = F2.y
                           AND F2.x = F.y
                           AND F.x != F.y)
        UNION
        -- Second subquery selects symmetric pairs that have x1 = y1.
        -- Group by x1 and y1 as we want to count the number of times a
        -- symmetric pair happen. We need to select only symmetric pairs
        -- with x1 = y1 that have Count(*) > 1. That is because, when
        -- x1 = y1, the row we have on table F will appear on F2 and be
        -- counted as a symmetric pair, when it is actually just a
        -- duplicate of itself.
        (SELECT F.x AS X1,
                F.y AS Y1
         FROM   functions F
                INNER JOIN functions F2
                        ON F.x = F2.y
                           AND F2.x = F.y
                           AND F.x = F.y
         GROUP  BY F.x,
                   F.y
         HAVING Count(*) > 1)) AS FUNCT
-- x1 must be smaller or equal to y1, as requested.
WHERE  x1 <= y1
ORDER  BY x1;