CREATE TABLE Лаборатории_пенсионеры5 (
     ИД_лаборатории serial PRIMARY KEY,
     Наименование_лаборатории character varying(100),
     Пенсионеры_весна numeric(5, 0),
     Пенсионеры_лето numeric(5, 0),
     Пенсионеры_осень numeric(5, 0),
     Пенсионеры_зима numeric(5, 0)
);

