INSERT INTO "Лаборатории_пенсионеры5" ("ИД_лаборатории", "Наименование_лаборатории", "Пенсионеры_весна", "Пенсионеры_лето", "Пенсионеры_осень", "Пенсионеры_зима", "Ср_возраст_пенсион_лаб")
SELECT
    "s_ЛАБОРАТОРИИ"."ИД" AS ИД_лаборатории,
    "s_ЛАБОРАТОРИИ"."НАИМЕНОВАНИЕ" AS Наименование_лаборатории,
    COUNT(CASE WHEN EXTRACT(MONTH FROM "ДЕНЬ_РОЖДЕНИЯ") IN (3, 4, 5) AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= CASE WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 65 ELSE 58 END THEN 1 END) AS Пенсионеры_весна,
    COUNT(CASE WHEN EXTRACT(MONTH FROM "ДЕНЬ_РОЖДЕНИЯ") IN (6, 7, 8) AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= CASE WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 65 ELSE 58 END THEN 1 END) AS Пенсионеры_лето,
    COUNT(CASE WHEN EXTRACT(MONTH FROM "ДЕНЬ_РОЖДЕНИЯ") IN (9, 10, 11) AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= CASE WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 65 ELSE 58 END THEN 1 END) AS Пенсионеры_осень,
    COUNT(CASE WHEN EXTRACT(MONTH FROM "ДЕНЬ_РОЖДЕНИЯ") IN (12, 1, 2) AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= CASE WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 65 ELSE 58 END THEN 1 END) AS Пенсионеры_зима,
    AVG(EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ"))) AS Ср_возраст_пенсион_лаб
FROM "s_ЛАБОРАТОРИИ"
         JOIN "s_СЛУЖАЩИЕ" ON "s_ЛАБОРАТОРИИ"."ИД" = "s_СЛУЖАЩИЕ"."ЛАБОРАТОРИЯ_ИД"
WHERE
    ("s_СЛУЖАЩИЕ"."ПОЛ" = 'М' AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= 65)
   OR
    ("s_СЛУЖАЩИЕ"."ПОЛ" = 'Ж' AND EXTRACT(YEAR FROM AGE(NOW(), "ДЕНЬ_РОЖДЕНИЯ")) >= 58)
GROUP BY "s_ЛАБОРАТОРИИ"."ИД", "s_ЛАБОРАТОРИИ"."НАИМЕНОВАНИЕ";
