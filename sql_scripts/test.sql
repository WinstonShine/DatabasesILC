use TranslucentDB
CREATE TABLE user (
    user_id int PRIMARY KEY AUTO INCREMENT,
    user_name char(50) NOT NULL,
    email char(50) NOT NULL,
)

CREATE TABLE account (
    account_id int NOT NULL AUTO INCREMENT,
    user_id int FOREIGN KEY
)

--lookup table for character classes
CREATE TABLE class (
    class_id int NOT NULL AUTO INCREMENT,
    class char (25) NOT NULL
)

--lookup table for character races
CREATE TABLE race (
    race_id int NOT NULL  AUTO INCREMENT,
    race char (25) NOT NULL
)

--all characters created
CREATE TABLE user_characters (
    character_id int NOT NULL PRIMARY KEY AUTO INCREMENT,
    account_id int NOT NULL,
    class_id int NOT NULL,
    race_id int NOT NULL
)

--Foreign Key constraints
--user_characters table
ALTER TABLE user_characters ADD CONSTRAINT fk_account
    FOREIGN KEY (account_id) REFERENCES account(account_id);
ALTER TABLE user_characters ADD CONSTRAINT fk_class
    FOREIGN KEY (class_id) REFERENCES class(class_id)