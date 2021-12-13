package com.pgryko.beggarrobot;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * @see <a href="http://d.android.com/tools/testing">Testing documentation</a>
 */
public class GestureAndSentenceUnitTest {
    @Test
    public void testCreateCommand() {

        // ------- left hand, move fast up
        String message = "Duration incorrectly calculated when: left hand, move fast up, percent is 100%";
        String expected = "01 01 01 1000 255|";
        String actual = GestureAndSentence.createCommandMoveHand(GestureAndSentence.Hand.LEFT, GestureAndSentence.Speed.FAST, GestureAndSentence.Direction.UP, GestureAndSentence.HandMovePercent._100);
        assertEquals(message, expected, actual);

        message = "Duration incorrectly calculated when: left hand, move fast up, percent is 50%";
        expected = "01 01 01 0500 255|";
        actual = GestureAndSentence.createCommandMoveHand(GestureAndSentence.Hand.LEFT, GestureAndSentence.Speed.FAST, GestureAndSentence.Direction.UP, GestureAndSentence.HandMovePercent._50);
        assertEquals(message, expected, actual);

        message = "Duration incorrectly calculated when: left hand, move fast up, percent is 30%";
        expected = "01 01 01 0300 255|";
        actual = GestureAndSentence.createCommandMoveHand(GestureAndSentence.Hand.LEFT, GestureAndSentence.Speed.FAST, GestureAndSentence.Direction.UP, GestureAndSentence.HandMovePercent._30);
        assertEquals(message, expected, actual);

        // right hand, move slow down
        message = "Duration incorrectly calculated when: right hand, move slow down, percent is 100%";
        expected = "01 02 02 3112 240|";
        actual = GestureAndSentence.createCommandMoveHand(GestureAndSentence.Hand.RIGHT, GestureAndSentence.Speed.SLOW, GestureAndSentence.Direction.DOWN, GestureAndSentence.HandMovePercent._100);
        assertEquals(message, expected, actual);

        message = "Duration incorrectly calculated when: right hand, move slow down, percent is 30%";
        expected = "01 02 02 0934 240|";
        actual = GestureAndSentence.createCommandMoveHand(GestureAndSentence.Hand.RIGHT, GestureAndSentence.Speed.SLOW, GestureAndSentence.Direction.DOWN, GestureAndSentence.HandMovePercent._30);
        assertEquals(message, expected, actual);

    }
}