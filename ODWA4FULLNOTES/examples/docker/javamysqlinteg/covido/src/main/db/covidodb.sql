create database if not exists covidodb;
use covidodb;
create table contact_us(contact_no integer AUTO_INCREMENT primary key, full_nm varchar(100), phone_number varchar(100), email_address varchar(100), message varchar(100));