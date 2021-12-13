DELETE FROM sentences_and_gestures;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'sentences_and_gestures';

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Silence_1s', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'stary_ze_mnie_robot', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(100) || ' ' || PWM_LEFT_SLOW_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Silence_0.5s', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Wylali_mnie_z_pracy', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() ||  ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() ||  ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || '|'); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Zastapili_mnie_nowym_robotem_a_mnie_rozmontowali_i_wyrzucili_na_zlom',
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|');

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Silence_1s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|');

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Nowe,_ciagle_nowe', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(50) || ' ' || PWM_LEFT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(50) || ' ' || PWM_RIGHT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(50) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(50) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' );

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Odkurzacz,_komputer,_telewizor', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(30) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(30) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 2500 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'A_co_ze_starymi', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(30) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Laduja_na_smietniku,_nawet_w_pelni_sprawne',
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(50) || ' ' || PWM_LEFT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(50) || ' ' || PWM_RIGHT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(50) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(50) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' );

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'No_to_pozbieralem_sobie_czesci_ze_zlomowiska', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Sami_zobaczcie', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' );

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Moje_podzespoly_sa_sprawne', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() ||
'|' );

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'A_wszystko_to_jest_z_rozmontowanych_starych_urzadzen', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Ale_coz_i_tak_jestem_bez_zadnych_perspektyw', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Nikt_nie_chce_juz_urzadzenia,_ktore_ma_10_lat_albo_wiecej', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(100) || ' ' || PWM_RIGHT_SLOW_DOWN() ||
'|' );

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Silence_1s', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Mam_malo_energii', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(100) || ' ' || PWM_RIGHT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(100) || ' ' || PWM_LEFT_SLOW_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Mam_akumulator_ze_starego,_smierdzacego_dymem_samochodu_spalinowego',
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'On_juz_dlugo_nie_pociagnie', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(100) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Pod_zadnym_pozorem_nie_bede_przy_nim_majstrowal', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Wnetrze_akumulatora_jest_bardzo_niebezpieczne', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Jest_tam_zrący_plyn_-_kwas_siarkowy', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(80) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(80) || ' ' || PWM_LEFT_FAST_DOWN() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'a_poza_tym_olow_rtec_czy_kadm', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 3000 000|' || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Same_trucizny', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(100) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'ale_wciaz_musze_uzywac_tego_brudnego_trujacego_grata_ktory_juz_sie_konczy', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' 
); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Gdy_sie_zuzyje,_to_ja_sam_juz_nic_ciekawego_z_niego_nie_zrobie', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Co_prawda_uzywam_starych_czesci_ale_nigdy_nie_rozbiore_akumulatora', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Oddam_specjalistom,_a_moze_nawet_sprzedam_do_skupu', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Nie_wiem_czy_wiecie_ale_nawet_taki_stary_akumulator_ma_swoja_wartosc', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(100) || ' ' || PWM_LEFT_SLOW_UP() || '|'  
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Bo_zawiera_cenne_pierwiastki_i_mozna_go_sprzedac', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Tak,_sprzedam_go', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Silence_3s', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Elektrosmieci_sa_jak_zloza_metali_XXI_w', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(50) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' 
); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Nazywa_sie_to_nawet_zartobliwie', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 2500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'ruda_miejska', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(100) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Taka_ruda_ze_zlomowanych_urzadzen_moze_byc_cennym_zrodlem_surowcow', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0400 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' 0700 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() ||  '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(30) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(30) || ' ' || PWM_RIGHT_FAST_DOWN() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Miedziane_przewody', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' 
); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Magnesy', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' 
); 

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Silence_2s', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Magnes_neodymowy', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Bardzo_mocny', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Obecnie_neodym_jest_metalem_rzadkim', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(50) || ' ' || PWM_LEFT_SLOW_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(50) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' 
);


INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'To_znaczy,_że_jest_bardzo_cenny', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'a_jest_potrzebny_do_budowy_-_np._turbin_wiatrowych', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(50) || ' ' || PWM_RIGHT_SLOW_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(50) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'albo_do_silnikow_samochodow_hybrydowych_lub_elektrycznych', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(50) || ' ' || PWM_RIGHT_SLOW_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(50) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Silence_3s',
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 1500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(100) || ' ' || PWM_LEFT_SLOW_UP() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'W_zuzytych_smartfonach_jest_wiecej_zlota_niz_w_naturalnych_zlozach',
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0400 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' 0700 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() ||  '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(30) || ' ' || PWM_RIGHT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(30) || ' ' || PWM_RIGHT_FAST_DOWN() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Koncentracja_zlota_w_naturalnej_rudzie_wynosi_tylko_kilka_gramow_w_jedej_tonie', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_SLOW_UP(100) || ' ' || PWM_RIGHT_SLOW_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(50) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_SLOW_UP(50) || ' ' || PWM_LEFT_SLOW_UP() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'a_za_to_mozliwa_ilosc_do_odzyskania_z_plytek_elektronicznych', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'to_od_kilkunastu_do_tysiaca_gramow', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 0400 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 0500 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() ||  '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|'
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'w_jednej_tonie_elektrosmieci', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'To_znaczy,_że_w_plytkach_elektronicznych_jest_wiecej_zlota_niż_w_kopalniach_zlota', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' 2000 000|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_SLOW_DOWN(100) || ' ' || PWM_LEFT_SLOW_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_SLOW_DOWN(100) || ' ' || PWM_RIGHT_SLOW_DOWN() || '|' 
);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('bad', 'Moglbym_wykorzystac_jeszcze_wiecej_czesci,_ktorych_juz_nikt_nie_potrzebuje', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('good', 'Moglbym_uczynic_je_na_powrot_uzytecznymi', NULL);

INSERT INTO sentences_and_gestures (mood, sentence_name, commands) VALUES ('cry', 'Ale_coz_i_tak_jestem_bez_zadnych_perspektyw', 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(100) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(100) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_LEFT_FAST_UP(50) || ' ' || PWM_LEFT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_LEFT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_LEFT_FAST_DOWN(50) || ' ' || PWM_LEFT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' 1000 000|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(100) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(100) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' ||
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_UP() || ' ' || TIME_RIGHT_FAST_UP(50) || ' ' || PWM_RIGHT_FAST_UP() || '|' || 
DEVICE_ID_MOTOR() || ' ' || MOTOR_NO_RIGHT() || ' ' || DIRECTION_ID_DOWN() || ' ' || TIME_RIGHT_FAST_DOWN(50) || ' ' || PWM_RIGHT_FAST_DOWN() || '|' 
);  