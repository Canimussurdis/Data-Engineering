DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS workers CASCADE;
DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS cars CASCADE;
DROP TABLE IF EXISTS car_mileage CASCADE;
DROP TABLE IF EXISTS services CASCADE;

CREATE TABLE workers (
    worker_id SERIAL PRIMARY KEY,
    w_first_name VARCHAR(50),
    w_last_name VARCHAR(50),
    w_exp INTEGER,
    w_phone VARCHAR(20),
    wages INTEGER
);

CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    car VARCHAR(30),
    vin VARCHAR(30),
    car_number VARCHAR(20),
    color VARCHAR(20)
);

CREATE TABLE car_mileage (
    mileage_id SERIAL PRIMARY KEY,
    car_id INTEGER REFERENCES cars(car_id),
    mileage INTEGER,
    mileage_date DATE
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service VARCHAR(100),
    service_addr VARCHAR(100)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    date DATE,
    payment INTEGER,
    pin INTEGER,
    card VARCHAR(20),
    worker_id INTEGER REFERENCES workers(worker_id),
    client_id INTEGER REFERENCES clients(client_id),
    car_id INTEGER REFERENCES cars(car_id),
    service_id INTEGER REFERENCES services(service_id)
);