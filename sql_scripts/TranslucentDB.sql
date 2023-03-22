CREATE DATABASE TranslucentDB;

use TranslucentDB;

CREATE TABLE user (
    user_id int PRIMARY KEY AUTO_INCREMENT,
    user_name char(50) NOT NULL,
    email BLOB
);

CREATE TABLE account (
    account_id int PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL
);

-- lookup table for character classes
CREATE TABLE class (
    class_id int PRIMARY KEY AUTO_INCREMENT,
    class char(25) NOT NULL
);

-- lookup table for character races
CREATE TABLE race (
    race_id int PRIMARY KEY AUTO_INCREMENT,
    race char(25) NOT NULL
);

-- items owned and stored in characters inventory
-- look up table for items, constraint to enforce that item exists in lookup table
CREATE TABLE inventory_items (
    item_id int PRIMARY KEY AUTO_INCREMENT,
    character_id int NOT NULL,-- add fk constraint
    item_name varchar(50) NOT NULL,
    item_quantity int NOT NULL -- constraints for min/max, reference lookup table to find max? reason: different items can have different max quantitys
);

-- all characters created
CREATE TABLE user_characters (
    character_id int PRIMARY KEY AUTO_INCREMENT,
    account_id int NOT NULL,
    class_id int NOT NULL,
    race_id int NOT NULL,
    character_level int NOT NULL -- add constraints for min/max level
);

-- Foreign Key constraints
-- user_characters table
ALTER TABLE user_characters ADD CONSTRAINT fk_account
    FOREIGN KEY (account_id) REFERENCES account(account_id);
ALTER TABLE user_characters ADD CONSTRAINT fk_class
    FOREIGN KEY (class_id) REFERENCES class(class_id);