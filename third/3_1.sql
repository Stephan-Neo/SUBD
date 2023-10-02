SELECT "s_СПЕЦИАЛЬНОСТИ"."НАИМЕНОВАНИЕ" AS "Наименование_специальности",
       COUNT("s_ДЕТИ_СОТРУДНИКОВ"."СЛУЖАЩИЙ_ИД") AS "Количество_сотрудников"
FROM "s_СПЕЦИАЛЬНОСТИ"
         LEFT JOIN "s_СЛУЖАЩИЕ" ON "s_СПЕЦИАЛЬНОСТИ"."ИД" = "s_СЛУЖАЩИЕ"."СПЕЦИАЛЬНОСТЬ_ИД"
         LEFT JOIN "s_ДЕТИ_СОТРУДНИКОВ" ON "s_СЛУЖАЩИЕ"."ИД" = "s_ДЕТИ_СОТРУДНИКОВ"."СЛУЖАЩИЙ_ИД"
WHERE "s_СПЕЦИАЛЬНОСТИ"."ДАТА_ЗАКРЫТИЯ" IS NULL
GROUP BY "s_СПЕЦИАЛЬНОСТИ"."НАИМЕНОВАНИЕ"
ORDER BY "s_СПЕЦИАЛЬНОСТИ"."НАИМЕНОВАНИЕ";