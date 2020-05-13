package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.dto.EntryDto;
import com.codesquad.baseball07.entity.Game;
import com.codesquad.baseball07.dto.GameDto;
import com.codesquad.baseball07.entity.Team;
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
        String sql = "select game.id as game_id," +
                " team.id as team_id," +
                " game_has_team.position," +
                " team.name as team_name" +
                " from game_has_team " +
                "join game on game_has_team.game_id = game.id " +
                "join team on game_has_team.team_id = team.id";
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

    public GameDto getGameForEntry(Long gameId) {
        String sql = "SELECT game.id, GROUP_CONCAT(CONCAT_WS(',', `valid`, `name`) SEPARATOR ',')  AS valid FROM GAME " +
                "JOIN game_has_team ON game_has_team.game_id = game.id " +
                "JOIN team ON team.id = game_has_team.team_id " +
                "WHERE game.id = ? GROUP BY game.id";

        return jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new GameDto(rs.getString("valid")),
                gameId);
    }

    public EntryDto enterGame(Long gameId, String teamName) {
        String sql = "SELECT game_has_team.valid FROM game_has_team " +
                "JOIN team ON team.id = game_has_team.team_id " +
                "WHERE game_has_team.game_id = ? AND team.name = ?";

        return jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new EntryDto(rs.getBoolean("valid")), gameId, teamName);
    }
}
