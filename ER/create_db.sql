CREATE TABLE Director (
                          id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          phone_number VARCHAR(20) NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          position VARCHAR(50),
                          createdAt TIMESTAMP,
                          deletedAt TIMESTAMP
);

CREATE TABLE Supplier (
                          id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          phone_number VARCHAR(20) NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          products TEXT[],
                          director_id INT REFERENCES Director(id),
                          createdAt TIMESTAMP,
                          deletedAt TIMESTAMP
);

CREATE TABLE Cook (
                      id SERIAL PRIMARY KEY,
                      name VARCHAR(50) NOT NULL,
                      phone_number VARCHAR(20) NOT NULL,
                      preferred_cuisine VARCHAR(50),
                      visited_restaurants VARCHAR(100),
                      director_id INT REFERENCES Director(id),
                      createdAt TIMESTAMP,
                      deletedAt TIMESTAMP
);

CREATE TABLE Visitor (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(50) NOT NULL,
                         createdAt TIMESTAMP,
                         deletedAt TIMESTAMP
);

CREATE TABLE Menu (
                      id SERIAL PRIMARY KEY,
                      dish VARCHAR(50) NOT NULL,
                      price DECIMAL(5,2),
                      cook_id INT REFERENCES Cook(id),
                      createdAt TIMESTAMP,
                      deletedAt TIMESTAMP
);

CREATE TABLE OrderTbl (
                          id SERIAL PRIMARY KEY,
                          visitor_id INT REFERENCES Visitor(id),
                          menu_id INT REFERENCES Menu(id),
                          order_date TIMESTAMP,
                          status VARCHAR(50),
                          createdAt TIMESTAMP,
                          deletedAt TIMESTAMP
);