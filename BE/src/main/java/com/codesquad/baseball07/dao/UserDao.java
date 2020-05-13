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
        String sql = "SELECT id from user where id =?";


        Long id =  jdbcTemplate.queryForObject(sql, new Object[]{userId}, Long.class);
        return id != null;
    }

    public void createUser(String userId) {
        String sql = "INSERT INTO user(id) VALUES(?)";
        Object[] params = new Object[] {userId};

        jdbcTemplate.update(sql, params);
    }
}
