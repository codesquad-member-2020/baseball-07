package com.codesquad.baseball07.controller;

import com.codesquad.baseball07.dto.EntryDto;
import com.codesquad.baseball07.entity.Game;
import com.codesquad.baseball07.dto.GameDto;
import com.codesquad.baseball07.service.GameService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @GetMapping("/games")
    public Map<String, List<Game>> games() {
        return gameService.getAll();
    }

    @GetMapping("/games/{gameId}")
    public GameDto getGameForEntry(@PathVariable("gameId") Long gameId) {
        return gameService.getGameForEntry(gameId);
    }

    @PatchMapping("/games/{gameId}/{teamName}")
    public EntryDto enterGame(@PathVariable("gameId") Long gameId, @PathVariable("teamName") String teamName) {
        return gameService.enterGame(gameId, teamName);
    }
}
