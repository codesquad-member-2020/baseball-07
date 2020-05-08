DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS game_has_team;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS action;
DROP TABLE IF EXISTS player_has_action;

CREATE TABLE user
(
    email varchar(256) primary key
);

CREATE TABLE game
(
    id             bigint auto_increment primary key,
    home_team_user varchar(256) references user (email),
    away_team_user varchar(256) references user (email)
);

CREATE TABLE team
(
    id   bigint auto_increment primary key,
    name varchar(45),
);

CREATE TABLE game_has_team
(
    game_id  bigint references game (id),
    team_id  bigint references team (id),
    position varchar(45),
    valid    boolean,
    score    int
);

CREATE TABLE player
(
    id          bigint primary key,
    team_id     bigint references team (id),
    match_order int,
    name        varchar(45)
);

CREATE TABLE action
(
    id     bigint,
    result varchar(45)
);

CREATE TABLE player_has_action
(
    player_id bigint references player (id),
    action_id bigint references action (id),
    game_id   bigint references game (id),
    inning    int,
    turn      varchar(45),
    count     int
);
