CREATE VIEW "П_Лаборатории5" AS
SELECT
    "s_ЛАБОРАТОРИИ"."НАИМЕНОВАНИЕ" AS "Наименование_лаборатории",
    CASE
        WHEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ" IS NOT NULL THEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ"
        ELSE (current_date - interval '1 year')
        END AS "Дата_начала_периода",
    CASE
        WHEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ" IS NOT NULL THEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ"
        ELSE current_date
        END AS "Дата_окончания_периода",
    EXTRACT(MONTH FROM (CASE
                            WHEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ" IS NOT NULL THEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ"
                            ELSE (current_date - interval '1 year')
        END) - (CASE
                    WHEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ" IS NOT NULL THEN "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ"
                    ELSE current_date
        END)) AS "Размер_периода",
    SUM(
            CASE
                WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'Ж' THEN "s_ПРЕМИИ"."РАЗМЕР"
                ELSE 0
                END
        ) AS "Премиальный_фонд_женщин",
    SUM(
            CASE
                WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN "s_ПРЕМИИ"."РАЗМЕР"
                ELSE 0
                END
        ) AS "Премиальный_фонд_мужчин"
FROM "s_ЛАБОРАТОРИИ"
         JOIN "s_ПРЕМИИ" ON "s_ЛАБОРАТОРИИ"."ИД" = "s_ПРЕМИИ"."СЛУЖАЩИЙ_ИД"
         JOIN "s_СЛУЖАЩИЕ" ON "s_ПРЕМИИ"."СЛУЖАЩИЙ_ИД" = "s_СЛУЖАЩИЕ"."ИМЯ"
GROUP BY "s_ЛАБОРАТОРИИ"."НАИМЕНОВАНИЕ", "s_ЛАБОРАТОРИИ"."ДАТА_ЗАКРЫТИЯ"
HAVING SUM(
               CASE
                   WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'Ж' THEN 1
                   ELSE 0
                   END
           ) > 0
   AND SUM(
               CASE
                   WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 1
                   ELSE 0
                   END
           ) > 0;
