-- furgut the sql recreated probably idk

CREATE TABLE weather_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    license VARCHAR(255) NOT NULL UNIQUE,
    weather VARCHAR(50) NOT NULL,
    time TIME NOT NULL,
    auto_load BOOLEAN NOT NULL,
    time_frozen BOOLEAN NOT NULL,
    weather_frozen BOOLEAN NOT NULL
);
