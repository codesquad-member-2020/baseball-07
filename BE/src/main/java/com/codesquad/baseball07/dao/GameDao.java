package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.dto.*;
import com.codesquad.baseball07.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class GameDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    PlayerDao playerDao;

    @Autowired
    PitchingRecordDao pitchingRecordDao;

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

    public void saveBall(Long gameId, String teamName, Ball ball) {
        this.jdbcTemplate.update("insert into ball (result) values (?)", ball.getResult());
        ball.setId(getNewBallId());

        Player hitter = playerDao.getAwayHitterPlayer(gameId, teamName, ball.getId());
        Player pitcher = playerDao.getPitcherPlayer(gameId, teamName);

        PitchingRecord recordOfBatter = pitchingRecordDao.getLastPitchingRecord(ball.getId(), hitter.getId());
        PitchingRecord recordOfPitcher = pitchingRecordDao.getLastPitchingRecord(ball.getId(), pitcher.getId());

        this.jdbcTemplate.update("INSERT INTO pitching_record " +
                        "(player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                hitter.getId(), ball.getId(), recordOfBatter.getInning(), recordOfBatter.getTurn(), recordOfBatter.getBallCount() + 1,
                recordOfBatter.getTurnAtBatCount(), recordOfBatter.getHitCount(), recordOfBatter.isStrikeOut());

        this.jdbcTemplate.update("INSERT INTO pitching_record " +
                        "(player, ball, inning, turn, ball_count, turn_at_bat_count, hit_count, strike_out) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                pitcher.getId(), ball.getId(), recordOfPitcher.getInning(), recordOfPitcher.getTurn(), recordOfPitcher.getBallCount() + 1,
                recordOfPitcher.getTurnAtBatCount(), recordOfPitcher.getHitCount(), recordOfPitcher.isStrikeOut());
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

    public Long getNewBallId() {
        return this.jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
    }

    public List<Map<String, Object>> getNewPitchingRecords(Long ballId) {
        String sql = "SELECT player.name, player.position, player.match_order, pitching_record.ball, " +
                "pitching_record.inning, pitching_record.turn, pitching_record.ball_count, " +
                "pitching_record.turn_at_bat_count, pitching_record.hit_count, pitching_record.strike_out, " +
                "ball.result FROM player join PITCHING_RECORD on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball " +
                "where pitching_record.ball = ?";

        return jdbcTemplate.queryForList(sql, ballId);
    };

    public ResultDto getResult() {
        List<Map<String, Object>> rows = getNewPitchingRecords(getNewBallId());
        ResultDto resultDto = new ResultDto();
        rows.forEach(row -> {
            if (((String) row.get("position")).equals("pitcher")) {
                resultDto.setPitcher(new Pitcher((String) row.get("name"), (int) row.get("ball_count")));
            }
            if (((String) row.get("position")).equals("hitter")) {
                resultDto.setHitter(new Hitter((String) row.get("name"), (int) row.get("match_order"),
                        (int) row.get("turn_at_bat_count"), (int) row.get("hit_count")));
            }
            resultDto.setInning((int) row.get("inning"));
            resultDto.setTurn((String) row.get("turn"));
            resultDto.setPitchResult((String) row.get("result"));
            resultDto.setOut((boolean) row.get("strike_out"));
        });
        return resultDto;
    }

    public HitterHistoryDto getHitterHistory(Long gameId, Long playerId, String teamName, int inning) {
//        Player hitter = playerDao.findByLastBallId(gameId, teamName, getNewBallId());
        Player hitter = playerDao.findByGameIdAndPlayerId(gameId, playerId);
        History history = new History();
        List<Map<String, Object>> rows = getHitterPitchResults(gameId, teamName, hitter.getId(), inning);
        List<String> pitchResult = new ArrayList<>();
        HitterHistoryDto hitterHistoryDto = new HitterHistoryDto();


        rows.forEach(row -> {
            history.setTurn((String) row.get("turn"));
            pitchResult.add((String) row.get("result"));
        });

        hitterHistoryDto.setInning(inning);
        history.setHitter(hitter.getName());
        history.setHitterOrder(hitter.getMatchOrder());
        history.setPitchResults(pitchResult);

        hitterHistoryDto.setHistories(history);


        return hitterHistoryDto;
    }

    public List<HitterHistoryDto> getHitterHistoryList(Long gameId, String teamName, int inning) {
        List<HitterHistoryDto> hitterHistoryDtoList = new ArrayList<>();
        List<Map<String, Object>> rows = getTeamPlayerIdList(teamName);
        rows.forEach(row -> {
            if (!getHitterHistory(gameId, (Long) row.get("id"), teamName, inning).getHistories().getPitchResults().isEmpty()) {
                hitterHistoryDtoList.add(getHitterHistory(gameId, (Long) row.get("id"), teamName, inning));
            }
        });
        return hitterHistoryDtoList;
    }

    public List<Map<String, Object>> getHitterPitchResults(Long gameId, String teamName, Long playerId, int inning) {
        String sql = "select pitching_record.turn, ball.result from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id " +
                "join player on player.team_id = team.id " +
                "join pitching_record on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball " +
                "where game.id = ? and team.name = ? and player.id = ? " +
                "and pitching_record.inning = ? and player.position = 'hitter'";

        return jdbcTemplate.queryForList(sql, gameId, teamName, playerId, inning);
    }

    private List<Map<String, Object>> getTeamPlayerIdList(String teamName) {
        String sql = "SELECT player.id FROM team join player on player.team_id = team.id where team.name = ?";

        return jdbcTemplate.queryForList(sql, teamName);
    }

    public EachInningScore getInningScore(Long gameId) {
        HomeTeam homeTeam = new HomeTeam();
        AwayTeam awayTeam = new AwayTeam();

        List<Map<String, Object>> rows = getEachInningScore(gameId);

        List<Integer> homeScore = new ArrayList<>();
        List<Integer> awayScore = new ArrayList<>();

        rows.forEach(row -> {
            for (int i = 1; i <= 9; i++) {
                if (((String) row.get("position")).equals("home") && ((int) row.get("inning")) == i) {
                    homeTeam.setName((String) row.get("name"));
                    homeScore.add(Math.toIntExact((Long) row.get("score")));
                }
                if (((String) row.get("position")).equals("away") && ((int) row.get("inning")) == i) {
                    awayTeam.setName((String) row.get("name"));
                    awayScore.add(Math.toIntExact((Long) row.get("score")));
                }
            }
        });

        homeTeam.setResult(homeScore);
        awayTeam.setResult(awayScore);

        return new EachInningScore(homeTeam, awayTeam);
    }

    public List<Map<String, Object>> getEachInningScore(Long gameId) {
        String sql = "SELECT team.name, sum(game_has_team.score) as score, " +
                "game_has_team.position, pitching_record.inning FROM game " +
                "join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id " +
                "join player on player.team_id = team.id " +
                "join pitching_record on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball " +
                "where game.id = ? group by game_has_team.position, pitching_record.inning";

        return jdbcTemplate.queryForList(sql, gameId);
    }
}

