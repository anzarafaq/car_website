-- Create a table for 'Make'
CREATE TABLE Make (
    make_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Create a table for 'Model'
CREATE TABLE Model (
    model_id SERIAL PRIMARY KEY,
    make_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_make
        FOREIGN KEY(make_id)
        REFERENCES Make(make_id),
    UNIQUE (make_id, name)
);

-- Create a table for 'Year'
CREATE TABLE Year (
    year_id SERIAL PRIMARY KEY,
    model_id INT NOT NULL,
    year INT NOT NULL,
    CONSTRAINT fk_model
        FOREIGN KEY(model_id)
        REFERENCES Model(model_id),
    UNIQUE (model_id, year)
);

-- Create a table for 'Trim'
CREATE TABLE Trim (
    trim_id SERIAL PRIMARY KEY,
    year_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT fk_year
        FOREIGN KEY(year_id)
        REFERENCES Year(year_id),
    UNIQUE (year_id, name)
);

