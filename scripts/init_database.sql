CREATE DATABASE IF NOT EXISTS remix_jokes;

USE remix_jokes;

CREATE TABLE jokes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "createdAt" TIMESTAMPTZ DEFAULT now(),
  "updatedAt" TIMESTAMPTZ,
  name STRING,
  content STRING
);

-- ~~~~~~~
-- Adding Authentication (https://remix.run/docs/en/v1/tutorials/jokes#authentication)
-- ~~~~~~~

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "createdAt" TIMESTAMPTZ DEFAULT now(),
  "updatedAt" TIMESTAMPTZ,
  username STRING UNIQUE NOT NULL,
  "passwordHash" STRING
);

-- Recreate jokes table with jokesterId 
DROP TABLE jokes;
CREATE TABLE jokes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  "jokesterId" UUID NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  "createdAt" TIMESTAMPTZ DEFAULT now(),
  "updatedAt" TIMESTAMPTZ,
  name STRING,
  content STRING
);