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
VALUES (1, 1, 'home', true, 0);
INSERT INTO game_has_team (game_id, team_id, position, valid, score)
VALUES (1, 2, 'away', true, 0);
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

INSERT INTO player(team_id, match_order, position , name) VALUES (1, 1, 'hitter', 'twins1');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 2, 'hitter', 'twins2');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 3, 'hitter', 'twins3');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 4, 'hitter', 'twins4');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 5, 'hitter', 'twins5');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 6, 'hitter', 'twins6');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 7, 'hitter', 'twins7');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 8, 'hitter', 'twins8');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 9, 'hitter', 'twins9');
INSERT INTO player(team_id, match_order, position , name) VALUES (1, 10, 'pitcher', 'twins10');

INSERT INTO player(team_id, match_order, position , name) VALUES (2, 1, 'hitter', 'tigers1');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 2, 'hitter', 'tigers2');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 3, 'hitter', 'tigers3');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 4, 'hitter', 'tigers4');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 5, 'hitter', 'tigers5');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 6, 'hitter', 'tigers6');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 7, 'hitter', 'tigers7');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 8, 'hitter', 'tigers8');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 9, 'hitter', 'tigers9');
INSERT INTO player(team_id, match_order, position , name) VALUES (2, 10, 'pitcher', 'tigers10');

INSERT INTO player(team_id, match_order, position , name) VALUES (3, 1, 'hitter', 'mocha1');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 2, 'hitter', 'mocha2');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 3, 'hitter', 'mocha3');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 4, 'hitter', 'mocha4');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 5, 'hitter', 'mocha5');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 6, 'hitter', 'mocha6');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 7, 'hitter', 'mocha7');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 8, 'hitter', 'mocha8');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 9, 'hitter', 'mocha9');
INSERT INTO player(team_id, match_order, position , name) VALUES (3, 10, 'pitcher', 'mocha10');

INSERT INTO player(team_id, match_order, position , name) VALUES (4, 1, 'hitter', 'mocha1');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 2, 'hitter', 'mocha2');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 3, 'hitter', 'mocha3');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 4, 'hitter', 'mocha4');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 5, 'hitter', 'mocha5');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 6, 'hitter', 'mocha6');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 7, 'hitter', 'mocha7');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 8, 'hitter', 'mocha8');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 9, 'hitter', 'mocha9');
INSERT INTO player(team_id, match_order, position , name) VALUES (4, 10, 'pitcher', 'mocha10');

INSERT INTO player(team_id, match_order, position , name) VALUES (5, 1, 'hitter', 'mocha1');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 2, 'hitter', 'mocha2');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 3, 'hitter', 'mocha3');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 4, 'hitter', 'mocha4');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 5, 'hitter', 'mocha5');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 6, 'hitter', 'mocha6');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 7, 'hitter', 'mocha7');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 8, 'hitter', 'mocha8');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 9, 'hitter', 'mocha9');
INSERT INTO player(team_id, match_order, position , name) VALUES (5, 10, 'pitcher', 'mocha10');

INSERT INTO player(team_id, match_order, position , name) VALUES (6, 1, 'hitter', 'mocha1');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 2, 'hitter', 'mocha2');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 3, 'hitter', 'mocha3');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 4, 'hitter', 'mocha4');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 5, 'hitter', 'mocha5');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 6, 'hitter', 'mocha6');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 7, 'hitter', 'mocha7');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 8, 'hitter', 'mocha8');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 9, 'hitter', 'mocha9');
INSERT INTO player(team_id, match_order, position , name) VALUES (6, 10, 'pitcher', 'mocha10');

INSERT INTO ball (result) VALUES ('BALL');
INSERT INTO ball (result) VALUES ('BALL');
INSERT INTO ball (result) VALUES ('STRIKE');
INSERT INTO ball (result) VALUES ('STRIKE');
INSERT INTO ball (result) VALUES ('BALL');
INSERT INTO ball (result) VALUES ('HIT');

INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 1,  1, 'top', 1, 1, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 1,  1, 'top', 1, 0, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 2,  1, 'top', 2, 1, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 2,  1, 'top', 2, 0, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 3,  1, 'top', 3, 1, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 3,  1, 'top', 3, 0, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 4,  1, 'top', 4, 1, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 4,  1, 'top', 4, 0, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 5,  1, 'top', 5, 1, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 5,  1, 'top', 5, 0, 0, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (1, 6,  1, 'top', 6, 1, 1, false);
INSERT INTO pitching_record (player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) VALUES (20, 6,  1, 'top', 6, 0, 0, false);
