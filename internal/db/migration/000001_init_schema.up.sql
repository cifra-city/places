CREATE TABLE "places"(
    "id" UUID NOT NULL PRIMARY KEY ,
    "distributor" BIGINT NOT NULL,
    "username" VARCHAR(255) NOT NULL UNIQUE,
    "name" VARCHAR(255) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "grade" FLOAT(53),
    "reviews_num" INTEGER NOT NULL DEFAULT 0,
    "tags" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "places" ADD CONSTRAINT "places_distributor_foreign" FOREIGN KEY("distributor") REFERENCES "distributor"("id");

CREATE TABLE "distributor"(
    "id" UUID NOT NULL PRIMARY KEY ,
    "name" VARCHAR(255) NOT NULL,
    "member" UUID[],
    "owner" UUID NOT NULL
);
ALTER TABLE
    "distributor" ADD CONSTRAINT "distributor_owner_unique" UNIQUE("owner");