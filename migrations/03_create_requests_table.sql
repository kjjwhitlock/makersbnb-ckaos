CREATE TABLE requests (
  id SERIAL PRIMARY KEY,
  space_id INTEGER REFERENCES spaces (id),
  renter_id INTEGER REFERENCES users (id)
);

ALTER TABLE requests ADD
confirmed VARCHAR (60);
