CREATE INDEX idx_clients_first_name ON clients (first_name);

CREATE INDEX idx_cars_car ON cars (car);

CREATE INDEX idx_services_service_addr ON services (service_addr);

CREATE INDEX idx_workers_w_exp ON workers (w_exp);

CREATE INDEX idx_car_mileage_car_id ON car_mileage (car_id);

CREATE INDEX idx_cleaned_data_date ON cleaned_data (date);

CREATE INDEX idx_discounts_discount_percentage ON discounts (discount_percentage);

CREATE INDEX idx_temp_data_date ON temp_data (date);

CREATE INDEX idx_transactions_date ON transactions (date);