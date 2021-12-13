DELETE FROM sentences_and_gestures;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'sentences_and_gestures';

/* LEWA ręka wolno 100%*/
INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Silence_2s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(100) || ' ' || PWM_LEFT_SLOW_UP() || '|');
INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Silence_2s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|');


/* LEWA ręka wolno 30%*/
INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Silence_2s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(30) || ' ' || PWM_LEFT_SLOW_UP() || '|');
INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Silence_2s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(30) || ' ' || PWM_LEFT_SLOW_DOWN() || '|');

/* odstęp */
INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Silence_5s', NULL);