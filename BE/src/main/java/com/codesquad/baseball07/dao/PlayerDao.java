package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.dto.PlayerDto;
import com.codesquad.baseball07.entity.Game;
import com.codesquad.baseball07.entity.PitchingRecord;
import com.codesquad.baseball07.entity.Player;
import com.codesquad.baseball07.entity.Team;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Repository
public class PlayerDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    PitchingRecordDao pitchingRecordDao;

    public PlayerDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public Player getPitcherPlayer(Long gameId, String teamName) {
        String sql = "select player.id, player.team_id, player.match_order, player.position, player.name " +
                "from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "where game.id = ? and team.name = ? and player.position = 'pitcher'";

        List<PitchingRecord> records = pitchingRecordDao.getAllRecordOfPitcher(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                gameId, teamName);
    }

    public Player getAwayHitterPlayer(Long gameId, String teamName, Long ballId) {
        String sql = "select * from player where player.id = ?";
        List<PitchingRecord> records = pitchingRecordDao.getAllRecordOfHitter(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                getAwayHitterIdAfterPitching(gameId, teamName, ballId));
    }

    public Player findByLastBallId(Long gameId, String teamName, Long ballId) {
        String sql = "select * from player where player.id = ?";
        List<PitchingRecord> records = pitchingRecordDao.getAllRecordOfHitter(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                getHitterIdBeforePitching(gameId, teamName, ballId));
    }

    public Player findByGameIdAndPlayerId(Long gameId, Long playerId) {
        String sql = "select player.id, player.match_order, player.position, player.name from player " +
                "where player.id = ?";

        List<PitchingRecord> pitchingRecords = pitchingRecordDao.findByGameIdAndPlayerId(gameId, playerId);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), pitchingRecords),
                playerId);
    }

    public Long getAwayHitterIdAfterPitching(Long gameId, String teamName, Long ballId) {
        String sql = "SELECT pitching_record.player from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "join pitching_record on pitching_record.player = player.id " +
                "where game.id = ? and not team.name = ? and pitching_record.ball = ?";

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> rs.getLong("player"), gameId, teamName, ballId - 1);
    }

    private List<Player> getPlayersByTeamId(Long teamId) {
        String sql = "SELECT id, position, name , match_order FROM player where team_id =" + teamId;
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        return rows.stream().map((row -> new Player((Long) row.get("id"), (Integer) row.get("match_order"), (String) row.get("position"), (String) row.get("name"))
        )).collect(Collectors.toList());
    }

    public Map<String, List<PlayerDto>> getPlayersByGameId(Long gameId) {
        Game game = this.getGameById(gameId);
        List<Player> homeTeamHitters = this.getPlayersByTeamId(game.getHomeTeam().getId()).stream().filter(player -> player.getPosition().equals("hitter")).collect(Collectors.toList());
        List<Player> awayTeamHitters = this.getPlayersByTeamId(game.getAwayTeam().getId()).stream().filter(player -> player.getPosition().equals("hitter")).collect(Collectors.toList());

        List<PlayerDto> homeTeamPlayerRecords = homeTeamHitters.stream().map(player -> {
            List<PitchingRecord> pitchingRecords = this.getAllPitchingRecordsByPlayerId(player.getId());
            return this.getPlayerRecord(pitchingRecords, player);
        }).collect(Collectors.toList());

        List<PlayerDto> awayTeamPlayerRecords = awayTeamHitters.stream().map(player -> {
            List<PitchingRecord> pitchingRecords = this.getAllPitchingRecordsByPlayerId(player.getId());
            return this.getPlayerRecord(pitchingRecords, player);
        }).collect(Collectors.toList());

        Map<String, List<PlayerDto>> players = new HashMap<>();
        players.put("homeTeam", homeTeamPlayerRecords);
        players.put("awayTeam", awayTeamPlayerRecords);
        return players;
    }

    private PlayerDto getPlayerRecord(List<PitchingRecord> pitchingRecords, Player player) {
        PlayerDto playerRecord = new PlayerDto();
        playerRecord.setName(player.getName());

        float average = 0F;
        int batCount = pitchingRecords.size();
        AtomicReference<Integer> hitCount = new AtomicReference<>(0);
        AtomicReference<Integer> outCount = new AtomicReference<>(0);
        pitchingRecords.forEach(pitching -> {
            if (pitching.isStrikeOut()) {
                outCount.getAndSet(hitCount.get() + 1);
            }
            String result = this.getBallByBallId(pitching.getBall());
            switch (result) {
                case "HIT":
                    hitCount.getAndSet(hitCount.get() + 1);
                    break;
                case "OUT":
                    outCount.getAndSet(hitCount.get() + 1);
                    break;
                default:
                    break;
            }
        });
        if (batCount != 0) {
            average = ((float) hitCount.get() / (float) batCount);
        }
        playerRecord.setBatCount(batCount);
        playerRecord.setOutCount(outCount.get());
        playerRecord.setHitCount(hitCount.get());
        playerRecord.setAverage(Float.parseFloat(String.format("%.3f", average)));
        return playerRecord;
    }

    public Long getHitterIdBeforePitching(Long gameId, String teamName, Long ballId) {
        String sql = "SELECT pitching_record.player from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "join pitching_record on pitching_record.player = player.id " +
                "where game.id = ? and team.name = ? and pitching_record.ball = ?";

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> rs.getLong("player"), gameId, teamName, ballId);
    }

    public Game getGameById(Long gameId) {
        String sql = "SELECT game_id, team_id, position FROM game_has_team  WHERE game_id =" + gameId;
        Game game = new Game();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

        List<Team> teams = rows.stream().map(row -> {
            Team team = new Team();
            team.setId((Long) row.get("team_id"));
            team.setGameId((Long) row.get("game_id"));
            team.setPosition((String) row.get("position"));
            return team;
        }).collect(Collectors.toList());

        for (Team team : teams) {
            if (team.getPosition().equals("home")) {
                game.setHomeTeam(team);
                continue;
            }
            game.setAwayTeam(team);
        }
        return game;
    }

    private List<PitchingRecord> getAllPitchingRecordsByPlayerId(Long playerId) {
        String sql = "SELECT * FROM pitching_record where player=" + playerId;
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        return rows.stream().map(row -> {
            return new PitchingRecord((Long)row.get("ball"),(Integer)row.get("inning"),
                    (String)row.get("turn"),(Integer) row.get("ball_count"),
                    (Integer) row.get("turn_at_bat_count"),(Integer) row.get("hit_count"),
                    (Boolean) row.get("strike_out"));
        }).collect(Collectors.toList());
    }

    private String getBallByBallId(Long ballId) {
        String sql = "SELECT result from ball where id=" + ballId;
        return jdbcTemplate.queryForObject(sql, String.class);
    }
}
