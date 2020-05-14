package com.codesquad.baseball07.service;

import com.codesquad.baseball07.dao.GameDao;
import com.codesquad.baseball07.dao.PlayerDao;
import com.codesquad.baseball07.dto.EntryDto;
import com.codesquad.baseball07.dto.GameDto;
import com.codesquad.baseball07.dto.PlayerDto;
import com.codesquad.baseball07.dto.ResultDto;
import com.codesquad.baseball07.entity.Ball;
import com.codesquad.baseball07.entity.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GameService {

    @Autowired
    private GameDao gameDao;

    @Autowired
    private PlayerDao playerDao;

    public Map<String, List<Game>> getAll() {
        List<Game> games = gameDao.getAll();
        Map<String, List<Game>> map = new HashMap<>();
        map.put("games", games);
        return map;
    }

    public GameDto getGameForEntry(Long gameId) {
        return gameDao.getGameForEntry(gameId);
    }

    public EntryDto enterGame(Long gameId, String teamName) {
        return gameDao.enterGame(gameId, teamName);
    }

    public ResultDto pitch(Long gameId, String teamName) {
        gameDao.saveBall(gameId, teamName, new Ball());
        return gameDao.getResult();
    }

    public Map<String, List<PlayerDto>> getPlayersByGameId(Long gameId) {
        return playerDao.getPlayersByGameId(gameId);
    }
}
