package com.codesquad.baseball07.dao;

import com.codesquad.baseball07.entity.PitchingRecord;
import com.codesquad.baseball07.entity.Player;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class PlayerDao {

    private final JdbcTemplate jdbcTemplate;
    private final GameDao gameDao;

    public PlayerDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.gameDao = new GameDao(dataSource);
    }

    public Player getPitcherPlayer(Long gameId, String teamName) {
        String sql = "select player.id, player.team_id, player.match_order, player.position, player.name " +
                "from game join game_has_team on game_has_team.game_id = game.id " +
                "join team on team.id = game_has_team.team_id join player on player.team_id = team.id " +
                "where game.id = ? and team.name = ? and player.position = 'pitcher'";

        List<PitchingRecord> records = gameDao.getAllRecordOfPitcher(gameId, teamName);

        return this.jdbcTemplate.queryForObject(sql,
                (rs, rowNum) -> new Player(rs.getLong("id"), rs.getInt("match_order"),
                        rs.getString("position"), rs.getString("name"), records),
                gameId, teamName);
    }

    public Player getBatterPlayer(Long gameId, String teamName, Long ballId) {
        String sql = "select * from player where player.id = ?";

        List<PitchingRecord> records = gameDao.getAllRecordOfHitter(gameId, teamName);

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
