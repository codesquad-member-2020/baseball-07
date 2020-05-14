DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS game_has_team;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS ball;
DROP TABLE IF EXISTS player_has_action;
DROP TABLE IF EXISTS pitching_record;

CREATE TABLE user
(
    id varchar(256) primary key
);

CREATE TABLE game
(
    id             bigint auto_increment primary key,
    home_team_user varchar(256) references user (id),
    away_team_user varchar(256) references user (id)
);

CREATE TABLE team
(
    id   bigint auto_increment primary key,
    name varchar(45)
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
    id          bigint auto_increment primary key,
    team_id     bigint references team (id),
    match_order int,
    position    varchar(45),
    name        varchar(45)
);

CREATE TABLE ball
(
    id     bigint auto_increment primary key,
    result varchar(45)
);

CREATE TABLE pitching_record
(
    player bigint       references player (id),
    ball bigint         references ball (id),
    inning              int,
    turn                varchar(45),
    ball_count          int,
    turn_at_bat_count   int,
    hit_count           int,
    strike_out          boolean,
    player_key          int,
    ball_key            int,
    primary key (player, ball)
);
