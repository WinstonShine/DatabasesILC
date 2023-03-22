-- SELECT USING AES_DECRYPT vs returning encrypted blob
SELECT user_name, AES_DECRYPT(email,'pass') as email FROM TranslucentDB.user;
SELECT user_name, email FROM TranslucentDB.user;


