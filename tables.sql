-- usuarios
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_email VARCHAR(255),
    user_password VARCHAR(255),
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL
);

-- Trabjadores/mineros
CREATE TABLE workers (
    worker_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    worker_name VARCHAR(255),
    worker_position VARCHAR(255), -- en caso de que tengamos admin
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- calidad de aire MQ135
CREATE TABLE air_sensor (
    air_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    air_sensor_quality INT,   -- segun como lo interpretemos 0 bien y 100 mal, talvez poner un estado con trigger
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- gps SIM808
CREATE TABLE gps_sensor (
    gps_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    gps_sensor_latitude DOUBLE,
    gps_sensor_longitude DOUBLE,
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

--  ultrasOnico HC-SR04
CREATE TABLE ultrasonic_sensor (
    ultrasonic_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    ultrasonic_sensor_object_distance INT,  -- aqui distancia de cm
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- temperatura DS18B20
CREATE TABLE temperature_sensor (
    temperature_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    temperature_sensor_temperature DOUBLE,
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- humo MQ-2
CREATE TABLE smoke_sensor (
    smoke_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    smoke_sensor_level INT,  -- nivel de humo
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- Humedad de tierra FC-28
CREATE TABLE humidity_sensor (
    humidity_sensor_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    humidity_sensor_soil_humidity INT,  -- aqui la humedad de la tierra
    created_at TIMESTAMP NULL,
	updated_at TIMESTAMP NULL,
	deleted_at TIMESTAMP NULL,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);
