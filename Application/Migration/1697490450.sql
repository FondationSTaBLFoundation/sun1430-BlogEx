ALTER TABLE users ALTER COLUMN failed_login_attempts SET DEFAULT '';
CREATE TABLE upvote (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL
);
CREATE TABLE downvote (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL
);
CREATE INDEX upvote_user_id_index ON upvote (user_id);
CREATE INDEX downvote_user_id_index ON downvote (user_id);
CREATE TABLE emoji (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    emoji TEXT DEFAULT '' NOT NULL
);
CREATE INDEX emoji_user_id_index ON emoji (user_id);
ALTER TABLE downvote ADD CONSTRAINT downvote_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE emoji ADD CONSTRAINT emoji_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE upvote ADD CONSTRAINT upvote_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
