CREATE TYPE "role" AS ENUM (
  'customer',
  'employee',
  'manage',
  'ceo'
);

CREATE TYPE "equipment_status" AS ENUM (
  'in_stock',
  'running',
  'damaged',
  'fixing'
);

CREATE TYPE "food_status" AS ENUM (
  'out_of_stock',
  'running',
  'canceled'
);

CREATE TABLE "account" (
  "email" varchar(64) PRIMARY KEY NOT NULL,
  "password" varchar(64) NOT NULL,
  "role" role,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "user_info" (
  "account_email" varchar(64),
  "name" varchar(64) NOT NULL,
  "sex" varchar(16) DEFAULT 'Nam',
  "birth_day" char(16) NOT NULL,
  "phone" char(11) DEFAULT ''
);

CREATE TABLE "film_genre" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(64) NOT NULL
);

CREATE TABLE "film" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "description" text,
  "duration" varchar(64),
  "release_date" timestamptz NOT NULL DEFAULT (now()),
  "image_url" varchar(255) NOT NULL
);

CREATE TABLE "film_detail" (
  "film_id" smallserial,
  "genre_id" smallserial
);

CREATE TABLE "theater" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "address" varchar(255) NOT NULL
);

CREATE TABLE "theater_room" (
  "id" smallserial PRIMARY KEY,
  "theater_id" smallserial NOT NULL,
  "name" varchar(255) NOT NULL,
  "number_of_seats" smallserial
);

CREATE TABLE "equipment" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(255) NOT NULL,
  "status" equipment_status,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "theater_room_detail" (
  "theater_room_id" smallserial,
  "equipment_id" smallserial
);

CREATE TABLE "show_time" (
  "id" smallserial PRIMARY KEY,
  "film_id" smallserial,
  "theater_room_id" smallserial,
  "price" smallserial,
  "started_time" timestamptz NOT NULL DEFAULT (now()),
  "ended_time" timestamptz NOT NULL DEFAULT (now()),
  "show_date" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "promotion" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "description" text NOT NULL,
  "percent_discount" smallserial,
  "started_date" timestamptz NOT NULL DEFAULT (now()),
  "ended_date" timestamptz NOT NULL DEFAULT (now()),
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "chair_type" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "percent" smallserial
);

CREATE TABLE "food" (
  "id" smallserial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "price" smallserial,
  "status" food_status
);

CREATE TABLE "bill" (
  "id" smallserial PRIMARY KEY,
  "account_email" varchar(64),
  "promotion_id" smallserial,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "order_form" (
  "bill_id" smallserial,
  "food_id" smallserial,
  "quantity" smallserial
);

CREATE TABLE "ticket" (
  "id" smallserial PRIMARY KEY,
  "bill_id" smallserial,
  "show_time_id" smallserial,
  "chair_type_id" smallserial
);

CREATE TABLE "comment" (
  "id" smallserial PRIMARY KEY,
  "account_email" varchar(64),
  "bill_id" smallserial,
  "content" text NOT NULL,
  "score" smallserial,
  "created_at" timestamptz NOT NULL DEFAULT (now()),
  "updated_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "account" ("email");

CREATE INDEX ON "film" ("name");

CREATE INDEX ON "film_detail" ("film_id");

CREATE INDEX ON "film_detail" ("genre_id");

CREATE UNIQUE INDEX ON "film_detail" ("film_id", "genre_id");

CREATE UNIQUE INDEX ON "theater_room" ("theater_id", "name");

CREATE UNIQUE INDEX ON "theater_room_detail" ("theater_room_id", "equipment_id");

CREATE INDEX ON "bill" ("id");

CREATE UNIQUE INDEX ON "bill" ("id", "promotion_id");

CREATE INDEX ON "order_form" ("bill_id");

CREATE UNIQUE INDEX ON "order_form" ("bill_id", "food_id");

CREATE INDEX ON "ticket" ("bill_id");

CREATE UNIQUE INDEX ON "ticket" ("id", "bill_id", "show_time_id", "chair_type_id");

COMMENT ON COLUMN "theater"."id" IS 'bigserial will be auto increment';

ALTER TABLE "user_info" ADD FOREIGN KEY ("account_email") REFERENCES "account" ("email");

ALTER TABLE "film_detail" ADD FOREIGN KEY ("film_id") REFERENCES "film" ("id");

ALTER TABLE "film_detail" ADD FOREIGN KEY ("genre_id") REFERENCES "film_genre" ("id");

ALTER TABLE "theater_room" ADD FOREIGN KEY ("theater_id") REFERENCES "theater" ("id");

ALTER TABLE "theater_room_detail" ADD FOREIGN KEY ("theater_room_id") REFERENCES "theater_room" ("id");

ALTER TABLE "theater_room_detail" ADD FOREIGN KEY ("equipment_id") REFERENCES "equipment" ("id");

ALTER TABLE "show_time" ADD FOREIGN KEY ("film_id") REFERENCES "film" ("id");

ALTER TABLE "show_time" ADD FOREIGN KEY ("theater_room_id") REFERENCES "theater_room" ("id");

ALTER TABLE "bill" ADD FOREIGN KEY ("account_email") REFERENCES "account" ("email");

ALTER TABLE "bill" ADD FOREIGN KEY ("promotion_id") REFERENCES "promotion" ("id");

ALTER TABLE "order_form" ADD FOREIGN KEY ("food_id") REFERENCES "food" ("id");

ALTER TABLE "ticket" ADD FOREIGN KEY ("bill_id") REFERENCES "bill" ("id");

ALTER TABLE "ticket" ADD FOREIGN KEY ("show_time_id") REFERENCES "show_time" ("id");

ALTER TABLE "ticket" ADD FOREIGN KEY ("chair_type_id") REFERENCES "chair_type" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("account_email") REFERENCES "account" ("email");

ALTER TABLE "comment" ADD FOREIGN KEY ("bill_id") REFERENCES "bill" ("id");
