package com.codesquad.baseball07;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Baseball07ApplicationTests {

    @Test
    void contextLoads() {
    }

//    @Autowired
//    private PlayerRepository playerRepository;
//
//    @Autowired
//    private BallRepository ballRepository;
//
//    private Logger logger = LoggerFactory.getLogger(Baseball07Application.class);
//
//    @Test
//    void playerRepo_FindById() {
//        Player player = playerRepository.findById(1L).get();
//        assertThat(player).isNotNull();
//        logger.debug("Find player with Id 1: {}", player);
//    }
//
//    @Test
//    void addBall() {
//        Ball ball = new Ball("STRIKE");
//        ballRepository.save(ball);
//
//        logger.info("After saving book: {}", ball);
//
//        Player player = playerRepository.findById(1L).get();
//        player.addPitchingRecord(ball, 1, "top", 7);
//        playerRepository.save(player);
//        for (PitchingRecord pitchingRecord : player.getPitchingRecords()) {
//            logger.debug("pitchingRecord info: {}", pitchingRecord);
//        }
//    }
}
