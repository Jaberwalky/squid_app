DROP TABLE transactions;
DROP TABLE accounts;
DROP TABLE categories;

CREATE TABLE accounts (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  balance NUMERIC(8,2),
  image VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  amount NUMERIC(8,2),
  category_id INT4 REFERENCES categories(id) ON DELETE CASCADE,
  account_id INT4 REFERENCES accounts(id) ON DELETE CASCADE
);
