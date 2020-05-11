package com.codesquad.baseball07.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public Boolean isExists(String userId) {
        String sql = "SELECT CASE WHEN EXISTS(SELECT * FROM USER WHERE id = ?) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END";

        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, Boolean.class);
    }

    public void createUser(String userId) {
        String sql = "INSERT INTO user(id) VALUES(?)";
        Object[] params = new Object[] {userId};

        jdbcTemplate.update(sql, params);
    }
}
