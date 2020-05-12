package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.dto.EntryDto;
import com.codesquad.baseball07.dto.ResultDto;
import com.codesquad.baseball07.entity.*;
import com.codesquad.baseball07.dto.GameDto;
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

    public ResultDto createBall(Long gameId, String teamName, Ball ball) {
        this.jdbcTemplate.update("insert into ball (result) values (?)", ball.getResult());
        ball.setId(this.jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class));

        Player batter = getBatterPlayer(gameId, teamName, ball.getId());
        Player pitcher = getPitcherPlayer(gameId, teamName);

        PitchingRecord recordOfBatter = getLastPitchingRecord(ball.getId(), batter.getId());
        PitchingRecord recordOfPitcher = getLastPitchingRecord(ball.getId(), pitcher.getId());

        this.jdbcTemplate.update("INSERT INTO pitching_record " +
                        "(player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                batter.getId(), ball.getId(), recordOfBatter.getInning(), recordOfBatter.getTurn(), recordOfBatter.getBallCount() + 1,
                recordOfBatter.getTurnAtBatCount(), recordOfBatter.getHitCount(), recordOfBatter.isStrikeOut());

        this.jdbcTemplate.update("INSERT INTO pitching_record " +
                        "(player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                pitcher.getId(), ball.getId(), recordOfPitcher.getInning(), recordOfPitcher.getTurn(), recordOfPitcher.getBallCount() + 1,
                recordOfPitcher.getTurnAtBatCount(), recordOfPitcher.getHitCount(), recordOfPitcher.isStrikeOut());

        return null;
    }

    public PitchingRecord getLastPitchingRecord(Long lastBallId, Long playerId) {
        String sql = "SELECT pitching_record.ball, pitching_record.inning, pitching_record.turn, " +
                "pitching_record.ball_count, pitching_record.turn_at_bat_count, pitching_record.hit_count, " +
                "pitching_record.strike_out FROM PITCHING_RECORD " +
                "where pitching_record.ball = ? and pitching_record.player = ?";

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new PitchingRecord(rs.getLong("ball"), rs.getInt("inning"),
                        rs.getString("turn"), rs.getInt("ball_count"),
                        rs.getInt("turn_at_bat_count"), rs.getInt("hit_count"),
                        rs.getBoolean("strike_out")),
                lastBallId - 1, playerId);
    }

    public List<PitchingRecord> getAllRecordOfPitcher(Long gameId, String teamName) {
        String sql = "select pitching_record.player, pitching_record.ball, " +
                "pitching_record.inning, pitching_record.turn, pitching_record.ball_count, " +
                "pitching_record.turn_at_bat_count, pitching_record.hit_count, pitching_record.strike_out from game " +
                "join game_has_team on game_has_team.game_id = game.id join team on team.id = game_has_team.team_id " +
                "join player on player.team_id = team.id join pitching_record on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball " +
                "where game.id = ? and team.name = ? and player.position = 'pitcher'";

        return this.jdbcTemplate.query(sql,
                (rs, rowNum) -> new PitchingRecord(rs.getLong("ball"), rs.getInt("inning"),
                        rs.getString("turn"), rs.getInt("ball_count"),
                        rs.getInt("turn_at_bat_count"), rs.getInt("hit_count"),
                        rs.getBoolean("strike_out")), gameId, teamName);


    }

    public List<PitchingRecord> getAllRecordOfHitter(Long gameId, String teamName) {
        String sql = "select pitching_record.player, pitching_record.ball, " +
                "pitching_record.inning, pitching_record.turn, pitching_record.ball_count, " +
                "pitching_record.turn_at_bat_count, pitching_record.hit_count, pitching_record.strike_out from game " +
                "join game_has_team on game_has_team.game_id = game.id join team on team.id = game_has_team.team_id " +
                "join player on player.team_id = team.id join pitching_record on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball \n" +
                "where game.id = ? and not team.name = ? and player.position = 'hitter'";

        return this.jdbcTemplate.query(sql,
                (rs, rowNum) -> new PitchingRecord(rs.getLong("ball"), rs.getInt("inning"),
                        rs.getString("turn"), rs.getInt("ball_count"),
                        rs.getInt("turn_at_bat_count"), rs.getInt("hit_count"),
                        rs.getBoolean("strike_out")), gameId, teamName);


    }

    public Player getPitcherPlayer(Long gameId, String teamName) {
        String sql = "select player.id, player.team_id, player.match_order, player.position, player.name " +
                "from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "where game.id = ? and team.name = ? and player.position = 'pitcher'";

        List<PitchingRecord> records = getAllRecordOfPitcher(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                gameId, teamName);
    }

    public Player getBatterPlayer(Long gameId, String teamName, Long ballId) {
        String sql = "select * from player where player.id = ?";

        List<PitchingRecord> records = getAllRecordOfHitter(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                getBatterId(gameId, teamName, ballId));
    }

    public Long getBatterId(Long gameId, String teamName, Long ballId) {
        String sql = "SELECT pitching_record.player from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "join pitching_record on pitching_record.player = player.id " +
                "where game.id = ? and not team.name = ? and pitching_record.ball = ?";

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> rs.getLong("player"), gameId, teamName, ballId - 1);
    }
}
