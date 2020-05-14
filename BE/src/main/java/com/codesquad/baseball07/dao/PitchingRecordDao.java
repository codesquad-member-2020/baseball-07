package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.entity.PitchingRecord;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class PitchingRecordDao {
    private final JdbcTemplate jdbcTemplate;

    public PitchingRecordDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public PitchingRecord getLastPitchingRecord(Long lastBallId, Long playerId) {
        String sql = "SELECT pitching_record.ball, pitching_record.inning, pitching_record.turn, " +
                "pitching_record.ball_count, pitching_record.turn_at_bat_count, pitching_record.hit_count, " +
                "pitching_record.strike_out FROM pitching_record " +
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

    public List<PitchingRecord> findByGameIdAndPlayerId(Long gameId, Long playerId) {
        String sql = "select pitching_record.player, pitching_record.ball, " +
                "pitching_record.inning, pitching_record.turn, pitching_record.ball_count, " +
                "pitching_record.turn_at_bat_count, pitching_record.hit_count, pitching_record.strike_out from game " +
                "join game_has_team on game_has_team.game_id = game.id join team on team.id = game_has_team.team_id " +
                "join player on player.team_id = team.id join pitching_record on pitching_record.player = player.id " +
                "join ball on ball.id = pitching_record.ball \n" +
                "where game.id = ? and player.id = ? and player.position = 'hitter'";

        return this.jdbcTemplate.query(sql,
                (rs, rowNum) -> new PitchingRecord(rs.getLong("ball"), rs.getInt("inning"),
                        rs.getString("turn"), rs.getInt("ball_count"),
                        rs.getInt("turn_at_bat_count"), rs.getInt("hit_count"),
                        rs.getBoolean("strike_out")), gameId, playerId);


    }
}
