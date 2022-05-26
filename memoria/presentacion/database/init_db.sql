CREATE TABLE IF NOT EXISTS tables (
  id SERIAL PRIMARY KEY,
  description VARCHAR NOT NULL,
  max_people INTEGER NOT NULL,
  min_people INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS bookings (
  id SERIAL PRIMARY KEY,
  tables_id SERIAL,
  username VARCHAR NOT NULL,
  people INTEGER NOT NULL,
  date_book VARCHAR NOT NULL,
  CONSTRAINT fk_book_table
    FOREIGN KEY(tables_id) REFERENCES tables(id)
);

INSERT INTO tables (description, max_people, min_people) VALUES
  ('Bonita mesa pequeña junto a la ventana', 2, 1),
  ('Bonita mesa mediana junto a la ventana', 4, 2),
  ('Bonita mesa grande junto a la cocina', 8, 6);
