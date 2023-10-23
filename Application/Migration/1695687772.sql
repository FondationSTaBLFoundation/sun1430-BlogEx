ALTER TABLE users DROP COLUMN failed_login_attempts;
ALTER TABLE users ADD COLUMN failed_login_attempts INT NOT NULL;
