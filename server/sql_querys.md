# Cretae Worker Category Table

CREATE TABLE worker_category (
category_id SERIAL PRIMARY KEY,
category_name TEXT NOT NULL,
category_description TEXT,
category_image TEXT NOT NULL,
user_email_id TEXT NOT NULL,
last_modified DATE NOT NULL,
status BOOL NOT NULL
);

# Cretae User Details Table

CREATE TABLE user_details (
email_id TEXT NOT NULL,
full_name TEXT NOT NULL,
user_password TEXT NOT NULL,
last_modified DATE NOT NULL,
status BOOL NOT NULL
);
