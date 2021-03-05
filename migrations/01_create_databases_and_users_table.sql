CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(60),
  email VARCHAR(60) UNIQUE,
  password VARCHAR(60)
);
