package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.dto.Game;
import com.codesquad.baseball07.dto.Team;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class GameDao {
    private final JdbcTemplate jdbcTemplate;

    public GameDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Game> getAll() {
        String sql = "select game.id as game_id, team.id as team_id, game_has_team.position, team.name as team_name from game_has_team join game on game_has_team.game_id = game.id join team on game_has_team.team_id = team.id";
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        List<Team> teams = new ArrayList<>();

        rows.forEach(row -> {
            Team team = new Team();
            team.setId((Long) row.get("team_id"));
            team.setGameId((Long) row.get("game_id"));
            team.setPosition((String) row.get("position"));
            team.setName((String) row.get("team_name"));
            teams.add(team);
        });

        Map<Long, Game> games = new HashMap<>();

        teams.forEach(team -> {
            Long gameId = team.getGameId();
            Game game;
            if (games.containsKey(gameId)) {
                game = games.get(gameId);
            } else {
                game = new Game();
                game.setId(gameId);
                games.put(gameId, game);
            }

            String position = team.getPosition();

            if (position.equals("home")) {
                game.setHomeTeam(team);
            } else {
                game.setAwayTeam(team);
            }
        });

        return new ArrayList<>(games.values());
    }
}
