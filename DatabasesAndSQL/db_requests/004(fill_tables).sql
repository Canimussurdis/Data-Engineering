INSERT INTO workers (w_first_name, w_last_name, w_exp, w_phone, wages)
SELECT DISTINCT
    w_first_name,
    w_last_name,
    w_exp,
    w_phone,
    wages
FROM public.cleaned_data
WHERE w_first_name IS NOT NULL AND w_last_name IS NOT NULL;

INSERT INTO clients (first_name, last_name, phone, email, password)
SELECT DISTINCT
    first_name,
    last_name,
    phone,
    email,
    password
FROM public.cleaned_data
WHERE first_name IS NOT NULL AND last_name IS NOT NULL;

INSERT INTO cars (car, vin, car_number, color)
SELECT DISTINCT
    car,
    vin,
    car_number,
    color
FROM public.cleaned_data
WHERE vin IS NOT NULL;

INSERT INTO car_mileage (car_id, mileage, mileage_date)
SELECT
    c.car_id,
    cd.mileage,
    cd.date
FROM public.cleaned_data cd
JOIN cars c ON c.vin = cd.vin
WHERE cd.mileage IS NOT NULL;

INSERT INTO services (service_name, service_addr)
SELECT DISTINCT
    service,
    service_addr
FROM public.cleaned_data
WHERE service IS NOT NULL AND service_addr IS NOT NULL;

INSERT INTO transactions (date, payment, pin, card, worker_id, client_id, car_id, service_id)
SELECT
    cd.date,
    cd.payment,
    cd.pin,
    cd.card,
    w.worker_id,
    cl.client_id,
    c.car_id,
    s.service_id
FROM public.cleaned_data cd
JOIN workers w ON w.w_first_name = cd.w_first_name AND w.w_last_name = cd.w_last_name
JOIN clients cl ON cl.first_name = cd.first_name AND cl.last_name = cd.last_name
JOIN cars c ON c.vin = cd.vin
JOIN services s ON s.service_name = cd.service AND s.service_addr = cd.service_addr;