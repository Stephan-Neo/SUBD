SELECT
    "СЛУЖАЩИЙ_ИД",
    SUM(CASE WHEN EXTRACT(MONTH FROM "ДАТА_ПРИКАЗА") IN (12, 1, 2) THEN "РАЗМЕР" ELSE 0 END) AS Зима_премия,
    SUM(CASE WHEN EXTRACT(MONTH FROM "ДАТА_ПРИКАЗА") IN (3, 4, 5) THEN "РАЗМЕР" ELSE 0 END) AS Весна_премия,
    SUM(CASE WHEN EXTRACT(MONTH FROM "ДАТА_ПРИКАЗА") IN (6, 7, 8) THEN "РАЗМЕР" ELSE 0 END) AS Лето_премия,
    SUM(CASE WHEN EXTRACT(MONTH FROM "ДАТА_ПРИКАЗА") IN (9, 10, 11) THEN "РАЗМЕР" ELSE 0 END) AS Осень_премия
FROM
    "s_ПРЕМИИ"
GROUP BY
    "СЛУЖАЩИЙ_ИД";