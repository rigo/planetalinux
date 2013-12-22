DROP TABLE IF EXISTS author;

CREATE TABLE author (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NULL,
    portal BOOLEAN NOT NULL DEFAULT 0,
    twitter TEXT NULL,
    enabled BOOLEAN NOT NULL DEFAULT 0,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS feed;
CREATE TABLE feed (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL
);

DROP TABLE IF EXISTS author_feed;
CREATE TABLE author_feed (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER,
    feed_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(feed_id) REFERENCES feed(id)
);

DROP TABLE IF EXISTS post;
CREATE TABLE post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    link TEXT NOT NULL,
    url TEXT NOT NULL,
    feed_id INTEGER,
    created TIMESTAMP NOT NULL,
    updated TIMESTAMP NOT NULL,
    FOREIGN KEY (feed_id) REFERENCES feed(id)
);

CREATE UNIQUE INDEX IF NOT EXISTS link ON post ( link );
CREATE INDEX IF NOT EXISTS feed_id ON post ( feed_id );

DROP TABLE IF EXISTS feed_post;
CREATE TABLE feed_post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    feed_id INTEGER,
    post_id INTEGER,
    FOREIGN KEY (feed_id) REFERENCES feed(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

DROP TABLE IF EXISTS country;
CREATE TABLE country (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    code TEXT NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS code ON country ( code );
CREATE UNIQUE INDEX IF NOT EXISTS name ON country ( name );

DROP TABLE IF EXISTS author_country;
CREATE TABLE author_country (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_id INTEGER,
    country_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);






