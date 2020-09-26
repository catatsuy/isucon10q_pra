DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    point       POINT AS (POINT(latitude, longitude)) STORED NOT NULL SRID 0,
    SPATIAL KEY estate_point_idx(point),
    INDEX idx_rent_id (`rent` ASC, `id` ASC),
    INDEX idx_popularity_id (`popularity` DESC, `id` ASC),
    INDEX idx_rent_door_width_height (`rent`, `door_width`, `door_height`)
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    INDEX idx_price_id (`price` ASC, `id` ASC),
    INDEX idx_price_stock (`price`, `stock`),
    INDEX idx_kind_stock (`kind`, `stock`),
    INDEX idx_color_stock (`color`, `stock`),
    INDEX idx_kind_color_stock (`kind`, `color`, `stock`),
    INDEX idx_popularity_id (popularity DESC, id ASC)
);
