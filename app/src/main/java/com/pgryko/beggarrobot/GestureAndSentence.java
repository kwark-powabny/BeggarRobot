package com.pgryko.beggarrobot;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.StringDef;

import com.pgryko.beggarrobot.database.DbManager;
import com.pgryko.beggarrobot.database.DbManager.*;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class GestureAndSentence {

    public class Mood {
        public static final String GOOD = "good";
        public static final String BAD = "bad";
        public static final String CRY = "cry";
    }

    public enum HandMovePercent {
        _30(30), _50(50), _100(100);
        private int mValue;

        HandMovePercent(int value) {
            this.mValue = value;
        } // Constructor

        public int value() {
            return mValue;
        }                  // Return enum index

//        public static HandMovePercent fromId(int value) {
//            for(HandMovePercent percent : values()) {
//                if (percent.mValue == value) {
//                    return percent;
//                }
//            }
//            return _30;
//        }
    }

    public static final class Speed {
        public static final byte FAST = 1, SLOW = 2;
    }
    public static final class Direction {
        public static final byte UP = 1, DOWN = 2;
    }
    public static final class Hand {
        public static final byte LEFT = 1, RIGHT = 2;
    }

    private static final String DEVICE_ID_MOTOR = "01";
    private static final String DEVICE_ID_LED = "02";

    private static final String MOTOR_NO_LEFT = "01";
    private static final String MOTOR_NO_RIGHT = "02";

    private static final String DIRECTION_ID_UP = "02";
    private static final String DIRECTION_ID_DOWN = "01";

//    // numerous values for gesture speed (PWM for Arduino PWM [0..255]
//    private static final String PWM_LEFT_FAST_UP = "255";
//    private static final String PWM_LEFT_FAST_DOWN = "255";
//    private static final String PWM_LEFT_SLOW_UP = "150";
//    private static final String PWM_LEFT_SLOW_DOWN = "048";
//
//    private static final String PWM_RIGHT_FAST_UP = "255";
//    private static final String PWM_RIGHT_FAST_DOWN = "255";
//    private static final String PWM_RIGHT_SLOW_UP = "245";
//    private static final String PWM_RIGHT_SLOW_DOWN = "208";
//
//    // numerous values for duration of the gesture (time of motor work) [0..9999] ms
//    private static final String TIME_LEFT_FAST_UP = "1000";
//    private static final String TIME_LEFT_FAST_DOWN = "1000";
//    private static final String TIME_LEFT_SLOW_UP = "2500";
//    private static final String TIME_LEFT_SLOW_DOWN = "2500";
//
//    private static final String TIME_RIGHT_FAST_UP = "1000";
    //    private static final String TIME_RIGHT_FAST_DOWN = "1000";
//    private static final String TIME_RIGHT_SLOW_UP = "2500";
//    private static final String TIME_RIGHT_SLOW_DOWN = "2500";


    public String mSentenceName; // TODO - powinny być prywatne, inny dostęp
    public String mMood;
    public String mCommands;

    public GestureAndSentence(String sentenceName, String mood, String commands) {
        mSentenceName = sentenceName;
        mMood = mood;
        mCommands = (commands != null)? commands : "";
    }

    public static String createCommandMoveHand(Context context, byte hand, byte speed, byte direction, HandMovePercent handMovePercent) {

        DbManager dbManager;
        dbManager = new DbManager(context);
        // device id - "motor"
        String commandSegmentMotorId = DEVICE_ID_MOTOR;

        // motor number
        String commandSegmentMotorNumber;
        if (hand == Hand.LEFT)
            commandSegmentMotorNumber = MOTOR_NO_LEFT;
        else
            commandSegmentMotorNumber = MOTOR_NO_RIGHT;


        // direction
        String commandSegmentDirection;
        if (direction == Direction.UP) {
            commandSegmentDirection = DIRECTION_ID_UP;

        } else {
            commandSegmentDirection = DIRECTION_ID_DOWN;
        }


        // duration of motor's work
        String commandSegmentDuration;

        // PWM
        String commandSegmentPwm;

        if (direction == Direction.UP)
            if (hand == Hand.LEFT)
                if (speed == Speed.FAST){
                    commandSegmentPwm = dbManager.getPwmLeftFastUp();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeLeftFastUp());
                }
                else{
                    commandSegmentPwm = dbManager.getPwmLeftSlowUp();
                    commandSegmentDuration = getDuration(handMovePercent,dbManager.getTimeLeftSlowUp());
                }
            else // right hand
                if (speed == Speed.FAST) {
                    commandSegmentPwm = dbManager.getPwmRightFastUp();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeRightFastUp());
                }
                else
                {
                    commandSegmentPwm = dbManager.getPwmRightSlowUp();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeLeftSlowUp());
                }

        else // direction down
            if (hand == Hand.LEFT)
                if (speed == Speed.FAST){
                    commandSegmentPwm = dbManager.getPwmLeftFastDown();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeLeftFastDown());
                }
                else{
                    commandSegmentPwm = dbManager.getPwmLeftSlowDown();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeLeftSlowDown());
                }
            else // right hand
                if (speed == Speed.FAST) {
                    commandSegmentPwm = dbManager.getPwmRightFastDown();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeRightFastDown());
                }
                else
                {
                    commandSegmentPwm = dbManager.getPwmRightSlowDown();
                    commandSegmentDuration = getDuration(handMovePercent, dbManager.getTimeRightSlowDown());
                }

        String command =    commandSegmentMotorId + ' ' +
                            commandSegmentMotorNumber + ' ' +
                            commandSegmentDirection + ' ' +
                            commandSegmentDuration  + ' ' +
                            commandSegmentPwm  +
                            '|'; // command separator

        dbManager.close();
        return command;

    }

    private static String getNumberWithLeadingZeros(String number, short digits){
        try {
            return getNumberWithLeadingZeros(Integer.parseInt(number), digits);
        }
        catch(Exception e){
            // TODO - log, e.g. conv not number
            return "";
        }
    }

    private static String getNumberWithLeadingZeros(int number, short digits){
        Integer intNumber = (int) Math.pow(10, digits) + number;
        return intNumber.toString().substring(1);
    }

    private static String getDuration(HandMovePercent percent, String totalTime){
        int calculation = Math.round ((float) percent.value() / 100 * Integer.parseInt(totalTime));
        return  getNumberWithLeadingZeros(calculation,(short)4);
    }



}
