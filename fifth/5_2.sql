DELETE FROM "Лаборатории_пенсионеры5"
WHERE "Ср_возраст_пенсион_лаб" > (
    SELECT AVG(
                   CASE
                       WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'М' THEN 65
                       WHEN "s_СЛУЖАЩИЕ"."ПОЛ" = 'Ж' THEN 58
                       ELSE NULL
                       END
               ) AS "Ср_возраст_пенсион_лаб"
    FROM "s_СЛУЖАЩИЕ"
    WHERE "s_СЛУЖАЩИЕ"."ПОЛ" IN ('М', 'Ж')
);
