CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE userprofile (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID DEFAULT NOT NULL,
    email VARCHAR(255) NOT NULL,
    roles VARCHAR(255) DEFAULT 'basic' NOT NULL,
    active BOOLEAN DEFAULT true NOT NULL,
    verified BOOLEAN DEFAULT false NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT unique_id UNIQUE (id),
    CONSTRAINT unique_email UNIQUE (email)
);
-- Index on email column
CREATE INDEX IF NOT EXISTS idx_userprofile_email ON userprofile(email);