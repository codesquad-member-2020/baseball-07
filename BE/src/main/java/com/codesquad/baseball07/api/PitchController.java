package com.codesquad.baseball07.api;

import com.codesquad.baseball07.response.ResponseData;
import com.codesquad.baseball07.service.PitchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PitchController {

    private static final Logger log = LoggerFactory.getLogger(PitchController.class);

    @Autowired
    PitchService pitchService;

    @PostMapping("/games/{gameId}/{teamName}")
    public ResponseEntity<ResponseData> pitchBall(@PathVariable("gameId") Long gameId, @PathVariable("teamName") String teamName) {
        log.debug("{} {} :", gameId, teamName);

        return new ResponseEntity<>(new ResponseData(new Object()), HttpStatus.OK);
    }
}
