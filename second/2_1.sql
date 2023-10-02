SELECT
    "ЛАБОРАТОРИЯ_ИД" AS Лаборатория,
    SUM(CASE WHEN "ПОЛ" = 'М' THEN 1 ELSE 0 END) AS Количество_мужчин,
    SUM(CASE WHEN "ПОЛ" = 'Ж' THEN 1 ELSE 0 END) AS Количество_женщин,
    MAX("ОКЛАД") AS Максимальный_оклад
FROM
    "s_СЛУЖАЩИЕ"
GROUP BY
    "ЛАБОРАТОРИЯ_ИД"
HAVING
        SUM(CASE WHEN "ПОЛ" = 'М' THEN 1 ELSE 0 END) > 2
   AND SUM(CASE WHEN "ПОЛ" = 'Ж' THEN 1 ELSE 0 END) >= 3;
