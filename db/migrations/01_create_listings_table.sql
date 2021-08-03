CREATE TABLE listings(listing_id SERIAL PRIMARY KEY, name VARCHAR(40), description VARCHAR(450), price INT, user_id INT);

ALTER TABLE listings ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id);