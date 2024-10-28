DROP TABLE IF EXISTS public.cleaned_data;
CREATE TABLE public.cleaned_data AS
SELECT DISTINCT
    date,
    COALESCE(service, 'Неизвестно') AS service,
    COALESCE(service_addr, 'Неизвестно') AS service_addr,
    COALESCE(split_part(w_name, ' ', 1), 'Неизвестно') AS w_first_name,
    COALESCE(split_part(w_name, ' ', 2), 'Неизвестно') AS w_last_name,
    COALESCE(w_exp, 0) AS w_exp,
    COALESCE(w_phone, 'Неизвестно') AS w_phone,
    COALESCE(wages, 0) AS wages,
    COALESCE(card, 'Неизвестно') AS card,
    COALESCE(payment, 0) AS payment,
    COALESCE(pin, 0) AS pin,
    COALESCE(split_part(name, ' ', 1), 'Неизвестно') AS first_name,
    COALESCE(split_part(name, ' ', 2), 'Неизвестно') AS last_name,
    COALESCE(phone, 'Неизвестно') AS phone,
    COALESCE(email, 'Неизвестно') AS email,
    COALESCE(password, 'Неизвестно') AS password,
    COALESCE(car, 'Неизвестно') AS car,
    COALESCE(mileage, 0) AS mileage,
    COALESCE(vin, 'Неизвестно') AS vin,
    COALESCE(car_number, 'Неизвестно') AS car_number,
    COALESCE(color, 'Неизвестно') AS color
FROM public.temp_data