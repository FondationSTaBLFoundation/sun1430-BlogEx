ALTER TABLE users ADD COLUMN confirmation_token TEXT DEFAULT null;
ALTER TABLE users ADD COLUMN is_confirmed BOOLEAN DEFAULT false NOT NULL;
