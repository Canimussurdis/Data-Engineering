-- Обновление поля service
UPDATE public.temp_data AS c1
SET service = (
    SELECT service
    FROM public.temp_data AS c2
    WHERE c2.w_first_name = c1.w_first_name
      AND c2.w_last_name = c1.w_last_name
      AND c2.service IS NOT NULL
    LIMIT 1
)
WHERE c1.service IS NULL;

-- Обновление поля service_addr
UPDATE public.temp_data AS c1
SET service_addr = (
    SELECT service_addr
    FROM public.temp_data AS c2
    WHERE c2.w_first_name = c1.w_first_name
      AND c2.w_last_name = c1.w_last_name
      AND c2.service_addr IS NOT NULL
    LIMIT 1
)
WHERE c1.service_addr IS NULL;

-- Обновление поля vin
UPDATE public.cleaned_data AS c1
SET
    vin = (
        SELECT vin
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.vin != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.vin = 'Неизвестно';

-- Обновление поля car
UPDATE public.cleaned_data AS c1
SET
    car = (
        SELECT car
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.car != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.car = 'Неизвестно';

-- Обновление поля first_name
UPDATE public.cleaned_data AS c1
SET
    first_name = (
        SELECT first_name
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.first_name != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.first_name = 'Неизвестно';

-- Обновление поля last_name
UPDATE public.cleaned_data AS c1
SET
    last_name = (
        SELECT last_name
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.last_name != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.last_name = 'Неизвестно';

-- Обновление поля phone
UPDATE public.cleaned_data AS c1
SET
    phone = (
        SELECT phone
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.phone != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.phone = 'Неизвестно';

-- Обновление поля email
UPDATE public.cleaned_data AS c1
SET
    email = (
        SELECT email
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.email != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.email = 'Неизвестно';

-- Обновление поля password
UPDATE public.cleaned_data AS c1
SET
    password = (
        SELECT password
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.password != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.password = 'Неизвестно';

-- Обновление поля color
UPDATE public.cleaned_data AS c1
SET
    color = (
        SELECT color
        FROM public.cleaned_data AS c2
        WHERE c2.car_number = c1.car_number
          AND c2.color != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.color = 'Неизвестно';

-- Обновление поля w_exp
UPDATE public.cleaned_data AS c1
SET 
    w_exp = (
        SELECT w_exp
        FROM public.cleaned_data AS c2
        WHERE c2.w_first_name = c1.w_first_name
          AND c2.w_last_name = c1.w_last_name
          AND c2.w_exp != 0
        LIMIT 1
    )
WHERE c1.w_exp = 0;

-- Обновление поля w_phone
UPDATE public.cleaned_data AS c1
SET 
    w_phone = (
        SELECT w_phone
        FROM public.cleaned_data AS c2
        WHERE c2.w_first_name = c1.w_first_name
          AND c2.w_last_name = c1.w_last_name
          AND c2.w_phone != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.w_phone = 'Неизвестно';

-- Обновление поля wages
UPDATE public.cleaned_data AS c1
SET 
    wages = (
        SELECT wages
        FROM public.cleaned_data AS c2
        WHERE c2.w_first_name = c1.w_first_name
          AND c2.w_last_name = c1.w_last_name
          AND c2.wages != 0
        LIMIT 1
    )
WHERE c1.wages = 0;

-- Обновление поля w_first_name
UPDATE public.cleaned_data AS c1
SET 
    w_first_name = (
        SELECT w_first_name
        FROM public.cleaned_data AS c2
        WHERE c2.w_phone = c1.w_phone
          AND c2.w_first_name != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.w_first_name = 'Неизвестно'
  AND c1.w_phone IS NOT NULL;

-- Обновление поля w_last_name
UPDATE public.cleaned_data AS c1
SET 
    w_last_name = (
        SELECT w_last_name
        FROM public.cleaned_data AS c2
        WHERE c2.w_phone = c1.w_phone
          AND c2.w_last_name != 'Неизвестно'
        LIMIT 1
    )
WHERE c1.w_last_name = 'Неизвестно'
  AND c1.w_phone IS NOT NULL;