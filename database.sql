DROP TABLE IF EXISTS wall;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS friend_requests;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(200) NOT NULL,
  lastname VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  avatar TEXT,
  user_bio VARCHAR(600)
);

CREATE TABLE friend_requests(
  id SERIAL PRIMARY KEY,
  sender_id INT REFERENCES users(id) NOT NULL,
  receiver_id INT REFERENCES users(id) NOT NULL,
  status INT NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE chat(
  id SERIAL PRIMARY KEY,
  messages VARCHAR(600) NOT NULL,
  sender_id INT REFERENCES users(id) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE wall(
  id SERIAL PRIMARY KEY,
  wallposts VARCHAR(600) NOT NULL,
  sender_id INT REFERENCES users(id) NOT NULL,
  receiver_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
