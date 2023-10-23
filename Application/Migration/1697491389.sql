DROP TABLE downvote;
DROP TABLE upvote;
DROP INDEX upvote_user_id_index;
ALTER TABLE upvote DROP CONSTRAINT upvote_ref_user_id;
CREATE TABLE vote (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    post_id UUID NOT NULL,
    if_up BOOLEAN DEFAULT true NOT NULL
);
CREATE INDEX vote_user_id_index ON vote (user_id);
CREATE INDEX vote_post_id_index ON vote (post_id);
ALTER TABLE vote ADD CONSTRAINT vote_ref_post_id FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE NO ACTION;
ALTER TABLE vote ADD CONSTRAINT vote_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
