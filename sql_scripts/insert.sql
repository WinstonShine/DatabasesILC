use TranslucentDB;
-- combines user name and password with a one way function for added security
-- down side, doesn't actually store the user name which could maybe be a positive or negative
INSERT INTO user (user_name, email) VALUES(SHA("Winston Shine/pass"), NULL);

-- encryption for security using AES_ENCRYPT(str, str_key)
-- field has to be blob for binary/varbinary data type to store values from aes_encrypt
use TranslucentDB;
INSERT INTO user (user_name, email) VALUES (SHA("user two/pass2"), AES_ENCRYPT('user2@gmail.com','pass'));