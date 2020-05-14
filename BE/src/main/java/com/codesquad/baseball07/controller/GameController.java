package com.codesquad.baseball07.controller;

import com.codesquad.baseball07.dto.EntryDto;
import com.codesquad.baseball07.dto.GameDto;
import com.codesquad.baseball07.dto.PlayerDto;
import com.codesquad.baseball07.entity.Game;
import com.codesquad.baseball07.response.ResponseHitterData;
import com.codesquad.baseball07.response.ResponsePitchData;
import com.codesquad.baseball07.service.GameService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/games/{gameId}")
    public GameDto getGameForEntry(@PathVariable("gameId") Long gameId) {
        return gameService.getGameForEntry(gameId);
    }

    @PatchMapping("/games/{gameId}/teams/{teamName}")
    public EntryDto enterGame(@PathVariable("gameId") Long gameId, @PathVariable("teamName") String teamName) {
        return gameService.enterGame(gameId, teamName);
    }

    @PostMapping("/games/{gameId}/teams/{teamName}")
    public ResponseEntity<ResponsePitchData> pitchBall(@PathVariable("gameId") Long gameId,
                                                       @PathVariable("teamName") String teamName) {

        return new ResponseEntity<>(new ResponsePitchData(
                gameService.pitch(gameId, teamName)), HttpStatus.OK);
    }

    @GetMapping("/games/{gameId}/teams/{teamName}/inning/{inning}")
    public ResponseEntity<ResponseHitterData> getHitterHistory(@PathVariable("gameId") Long gameId,
                                                               @PathVariable("teamName") String teamName,
                                                               @PathVariable("inning") int inning) {

        return new ResponseEntity<>(new ResponseHitterData(
                gameService.getHitterHistory(gameId, teamName, inning)), HttpStatus.OK);
    }

    @GetMapping("/games/{gameId}/teams")
    public Map<String, List<PlayerDto>> players(@PathVariable("gameId") Long gameId) {
        return gameService.getPlayersByGameId(gameId);
    }
}
