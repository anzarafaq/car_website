

## Login as postgres (privileged user)

psql postgres
create user carsuser with encrypted password 'mypass';

create database carsdb;
grant all privileges on database carsdb to carsuser;



## for normal operations, use 'carsuser' (pw: mypass)
psql postgres -U carsuser

# Create Schema

psql postgres -U carsuser < createDB.sql

# Import all Makes

psql postgres -U carsuser -c "\copy Make FROM 'AllMakes.csv' DELIMITER ',' CSV";



