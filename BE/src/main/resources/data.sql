INSERT INTO user(id)
VALUES ('ellie');
INSERT INTO user(id)
VALUES ('mocha');


INSERT INTO team (id, name)
VALUES (1, 'Twins');
INSERT INTO team (id, name)
VALUES (2, 'Tigers');
INSERT INTO team(id, name)
VALUES (3, 'Captain');
INSERT INTO team(id, name)
VALUES (4, 'Marvel');
INSERT INTO team(id, name)
VALUES (5, 'Rockets');
INSERT INTO team(id, name)
VALUES (6, 'Dodgers');


INSERT INTO game (id, home_team_user, away_team_user)
VALUES (1, 'mocha', 'ellie');
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (2, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (3, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (4, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (5, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (6, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (7, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (8, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (9, null, null);
INSERT INTO game (id, home_team_user, away_team_user)
VALUES (10, null, null);



INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (1, 1, 'home', false, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (1, 2, 'away', false, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (2, 3, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (2, 4, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (3, 5, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (3, 6, 'away', true, 0);

INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (4, 1, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (4, 3, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (5, 1, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (5, 4, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (6, 1, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (6, 5, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (7, 1, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (7, 6, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (8, 6, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (8, 2, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (9, 6, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (9, 3, 'away', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (10, 6, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (10, 4, 'away', true, 0);
