package com.codesquad.baseball07.controller;

import com.codesquad.baseball07.dto.Game;
import com.codesquad.baseball07.service.GameService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class GameController {

    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
    }

    @GetMapping("/games")
    public Map<String, List<Game>> games() {
        return gameService.getAll();
    }
}
