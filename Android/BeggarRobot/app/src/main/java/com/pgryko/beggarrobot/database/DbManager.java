package com.pgryko.beggarrobot.database;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;


import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.pgryko.beggarrobot.MainActivity;


import com.pgryko.beggarrobot.GestureAndSentence;
import com.pgryko.beggarrobot.R;

import java.util.ArrayList;

public class DbManager extends SQLiteOpenHelper {
    private static final String DB_NAME = MainActivity.PATH + "robot_beggar.db";
    //    private static final int DB_VERSION = 1;
//    public static final String INDEX = "index";
    public static final String MOOD = "mood";
    public static final String SENTENCE_NAME = "sentence_name";
    public static final String COMMANDS = "commands";
    public static final String TABLE_NAME_SENTENCES_AND_GESTURES = "sentences_and_gestures";

    public static final String TABLE_NAME_PARAMETERS = "parameters";
    public static final String PARAMETER_NAME = "name";
    public static final String PARAMETER_VALUE = "value";

    public static final class ParameterNames{

        //public static final String BASE_PATH = "BASE_PATH";
        public static final String FIRST_SENTENCE_NO = "FIRST_SENTENCE_NO";
        //public static final String LAST_SENTENCE_NO = "LAST_SENTENCE_NO";

        // parameters for gesture speed (PWM for Arduino PWM [0..255])
        public static final String PWM_LEFT_FAST_UP = "PWM_LEFT_FAST_UP";
        public static final String PWM_LEFT_FAST_DOWN = "PWM_LEFT_FAST_DOWN";
        public static final String PWM_LEFT_SLOW_UP = "PWM_LEFT_SLOW_UP";
        public static final String PWM_LEFT_SLOW_DOWN = "PWM_LEFT_SLOW_DOWN";

        public static final String PWM_RIGHT_FAST_UP = "PWM_RIGHT_FAST_UP";
        public static final String PWM_RIGHT_FAST_DOWN = "PWM_RIGHT_FAST_DOWN";
        public static final String PWM_RIGHT_SLOW_UP = "PWM_RIGHT_SLOW_UP";
        public static final String PWM_RIGHT_SLOW_DOWN = "PWM_RIGHT_SLOW_DOWN";

        // parameters for duration of the gesture (time of motor work) [0..9999] ms
        public static final String TIME_LEFT_FAST_UP = "TIME_LEFT_FAST_UP";
        public static final String TIME_LEFT_FAST_DOWN = "TIME_LEFT_FAST_DOWN";
        public static final String TIME_LEFT_SLOW_UP = "TIME_LEFT_SLOW_UP";
        public static final String TIME_LEFT_SLOW_DOWN = "TIME_LEFT_SLOW_DOWN";

        public static final String TIME_RIGHT_FAST_UP = "TIME_RIGHT_FAST_UP";
        public static final String TIME_RIGHT_FAST_DOWN = "TIME_RIGHT_FAST_DOWN";
        public static final String TIME_RIGHT_SLOW_UP = "TIME_RIGHT_SLOW_UP";
        public static final String TIME_RIGHT_SLOW_DOWN = "TIME_RIGHT_SLOW_DOWN";

    }



    private static final String TAG = "DB_MANAGER";
    private Context context;
    //private SQLiteDatabase database;
    // private SQLiteHelper dbHelper;

    public DbManager(Context c) {
        super(c, DB_NAME, null, 1);
        this.context = c;
    }

//    public DbManager open() throws SQLException {
//        //this.dbHelper = new SQLiteHelper(this.context);
//        this.database = this.dbHelper.getReadableDatabase();
//
//        return this;
//    }

    //    public void close() {
    //        this.dbHelper.close();
    //    }

//    public void insert(String name, String desc) {
//        ContentValues contentValue = new ContentValues();
//        contentValue.put(SQLiteHelper.NAME, name);
//        contentValue.put(SQLiteHelper.AGE, desc);
//        this.database.insert(SQLiteHelper.TABLE_NAME_STUDENT, null, contentValue);
//    }


    public ArrayList<GestureAndSentence> getListGesturesAndSentences() {

        ArrayList<GestureAndSentence> listGesturesAndSentences = new ArrayList<GestureAndSentence>();
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.query(TABLE_NAME_SENTENCES_AND_GESTURES, new String[]{MOOD, SENTENCE_NAME, COMMANDS}, null, null, null, null, null);
        if (cursor != null) {
            while(cursor.moveToNext()) {
                int columnIndex;

                columnIndex = cursor.getColumnIndexOrThrow(SENTENCE_NAME);
                String sentenceName = cursor.getString(columnIndex);

                columnIndex = cursor.getColumnIndexOrThrow(COMMANDS);
                String commands = cursor.getString(columnIndex);

                columnIndex = cursor.getColumnIndexOrThrow(MOOD);
                String mood = cursor.getString(columnIndex);

                listGesturesAndSentences.add(new GestureAndSentence(sentenceName, mood, commands));
            }
        }
        db.close();
        return listGesturesAndSentences;
    }


    private String getStringParameter(String parameterName){
        String where = PARAMETER_NAME + "=?";
        String[] whereArgs  = {parameterName};
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_NAME_PARAMETERS, new String[]{PARAMETER_NAME, PARAMETER_VALUE}, where, whereArgs, null, null, null);
        if (cursor != null) {
            cursor.moveToFirst();
            int columnIndex;
            columnIndex = cursor.getColumnIndexOrThrow(PARAMETER_VALUE);
            db.close();
            return cursor.getString(columnIndex);
        } else {
            Log.e(TAG, context.getString(R.string.message_1) + parameterName);
            db.close();
            return null;
        }
    }

    public String getPwmLeftFastUp() {
        return getStringParameter(ParameterNames.PWM_LEFT_FAST_UP);
    }

    public String getPwmLeftFastDown() {
        return getStringParameter(ParameterNames.PWM_LEFT_FAST_DOWN);
    }

    public String getPwmLeftSlowUp() {
        return getStringParameter(ParameterNames.PWM_LEFT_SLOW_UP);
    }

    public String getPwmLeftSlowDown() {
        return getStringParameter(ParameterNames.PWM_LEFT_SLOW_DOWN);
    }

    public String getPwmRightFastUp() {
        return getStringParameter(ParameterNames.PWM_RIGHT_FAST_UP);
    }

    public String getPwmRightFastDown() {
        return getStringParameter(ParameterNames.PWM_RIGHT_FAST_DOWN);
    }

    public String getPwmRightSlowUp() {
        return getStringParameter(ParameterNames.PWM_RIGHT_SLOW_UP);
    }

    public String getPwmRightSlowDown() {
        return getStringParameter(ParameterNames.PWM_RIGHT_SLOW_DOWN);
    }

    public String getTimeLeftFastUp() {
        return getStringParameter(ParameterNames.TIME_LEFT_FAST_UP);
    }

    public String getTimeLeftFastDown() {
        return getStringParameter(ParameterNames.TIME_LEFT_FAST_DOWN);
    }

    public String getTimeLeftSlowUp() {
        return getStringParameter(ParameterNames.TIME_LEFT_SLOW_UP);
    }

    public String getTimeLeftSlowDown() {
        return getStringParameter(ParameterNames.TIME_LEFT_SLOW_DOWN);
    }

    public String getTimeRightFastUp() {
        return getStringParameter(ParameterNames.TIME_RIGHT_FAST_UP);
    }

    public String getTimeRightFastDown() {
        return getStringParameter(ParameterNames.TIME_RIGHT_FAST_DOWN);
    }

    public String getTimeRightSlowUp() {
        return getStringParameter(ParameterNames.TIME_RIGHT_SLOW_UP);
    }

    public String getTimeRightSlowDown() {
            return getStringParameter(ParameterNames.TIME_RIGHT_SLOW_DOWN);
    }

    public int getFirstSentenceNo() {
        try{
            return Integer.valueOf(getStringParameter(ParameterNames.FIRST_SENTENCE_NO));
        }catch (Exception e) {
            return -1;
        }
    }

//    public String getBasePath(){
//        try{
//            return getStringParameter(ParameterNames.FIRST_SENTENCE_NO);
//        }catch (Exception e) {
//            return "";
//        }
//    }


    @Override
    public void onCreate(SQLiteDatabase db) {
        // not used
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // not used
    }
//    public int getLastSentenceNo() {
//        try{
//        return Integer.valueOf(getStringParameter(SQLiteHelper.ParameterNames.LAST_SENTENCE_NO));
//        }catch (Exception e) {
//            return -1;
//        }
//    }

//    public int update(long _id, String name, String desc) {
//        ContentValues contentValues = new ContentValues();
//        contentValues.put(SQLiteHelper.NAME, name);
//        contentValues.put(SQLiteHelper.AGE, desc);
//        return this.database.update(SQLiteHelper.TABLE_NAME_STUDENT, contentValues, "_id = " + _id, null);
//    }

//    public void delete(long _id) {
//        this.database.delete(SQLiteHelper.TABLE_NAME_STUDENT, "_id=" + _id, null);
//    }
}
