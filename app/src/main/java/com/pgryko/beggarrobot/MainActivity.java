package com.pgryko.beggarrobot;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.DialogInterface;
import android.media.AudioAttributes;
import android.media.audiofx.Visualizer;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

import android.content.Intent;
import android.view.View;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.IBinder;

import java.lang.ref.WeakReference;
import java.util.Set;

import com.pgryko.beggarrobot.database.DbManager;
import com.pgryko.beggarrobot.usbserial.UsbService;
import com.pgryko.beggarrobot.GestureAndSentence.*;

public class MainActivity extends AppCompatActivity implements Visualizer.OnDataCaptureListener {

    TextView textView; // for test purpose
    TextView textViewWaveForm; // for test purpose
    public static final String MAIN_ACTIVITY = "MAIN_ACTIVITY";
    public static final String USB_DEBUG = "USB_DEBUG";
    public static final String MEDIA_PLAYER_DEBUG = "MEDIA_PLAYER_DEBUG";
    private String currentTime;
    public static final String PATH = "/mnt/sdcard/DCIM/BeggarRobot/";

    /*
     * Notifications from UsbService will be received here.
     */
    private final BroadcastReceiver mUsbReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            switch (intent.getAction()) {
                case UsbService.ACTION_USB_PERMISSION_GRANTED: // USB PERMISSION GRANTED
                    Toast.makeText(context, "USB Ready", Toast.LENGTH_SHORT).show();
                    break;
                case UsbService.ACTION_USB_PERMISSION_NOT_GRANTED: // USB PERMISSION NOT GRANTED
                    Toast.makeText(context, "USB Permission not granted", Toast.LENGTH_SHORT).show();
                    break;
                case UsbService.ACTION_NO_USB: // NO USB CONNECTED
                    Toast.makeText(context, "No USB connected", Toast.LENGTH_SHORT).show();
                    break;
                case UsbService.ACTION_USB_DISCONNECTED: // USB DISCONNECTED
                    Toast.makeText(context, "USB disconnected", Toast.LENGTH_SHORT).show();
                    break;
                case UsbService.ACTION_USB_NOT_SUPPORTED: // USB NOT SUPPORTED
                    Toast.makeText(context, "USB device not supported", Toast.LENGTH_SHORT).show();
                    break;
            }
        }
    };
    private UsbService usbService;
    private String dataReceivedFromUsb; // not used in normal work. But you can use it to check Usb connection
    //private TextView display;
    //private EditText editText;
    private MyHandler mHandler;
    private DbManager mDbManager;

    private final ServiceConnection usbConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName arg0, IBinder arg1) {
            usbService = ((UsbService.UsbBinder) arg1).getService();
            usbService.setHandler(mHandler);
        }

        @Override
        public void onServiceDisconnected(ComponentName arg0) {
            usbService = null;
        }
    };

    private static final int CAPTURE_SIZE = 256;
    private Visualizer visualiser;


    private String mMood = Mood.GOOD;

    private ArrayList<GestureAndSentence> listGesturesAndSentences = new ArrayList<GestureAndSentence>();
    private int sentenceNumber = -1;

    private Handler timerHandlerEyesMovement; // to animate eyes expression
    private Runnable repetitiveRunnableEyesMovement; // to animate eyes expression

    private Handler timerHandlerSpeechMovement; // to animate speech
    private Runnable repetitiveRunnableSpeechMovement; // to animate speech

    private boolean isMouthSpeaking = false;
    private boolean eyesMoveEnabled = true;
    private MediaPlayer mediaPlayerSpeech;
    private GestureAndSentence currentGestureAndSentence;

    ImageView imageViewTop; // = (ImageView) findViewById(R.id.image_view_top);
    ImageView imageViewBottom; // = (ImageView) findViewById(R.id.image_view_bottom);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mDbManager = new DbManager(this);
        if (mDbManager == null){
            Log.e(MAIN_ACTIVITY, getString(R.string.message_4));
            Toast.makeText(this, R.string.message_4, Toast.LENGTH_LONG);
            finish(); // leave activity
        }

//        mBasePath = mDbManager.getBasePath();
//        if (mBasePath == null || mBasePath == ""){
//            Log.e(MAIN_ACTIVITY, getString(R.string.message_3));
//            Toast.makeText(this, R.string.message_3, Toast.LENGTH_LONG);
//            finish(); // leave activity
//        }

        mHandler = new MyHandler(this);

        textView = findViewById(R.id.textView);
        textView.setHorizontallyScrolling(true);
        textView.setMovementMethod(new ScrollingMovementMethod());

        textViewWaveForm = findViewById(R.id.textViewWaveForm);

        imageViewTop = (ImageView) findViewById(R.id.image_view_top);
        imageViewBottom = (ImageView) findViewById(R.id.image_view_bottom);


        // initialize media player for speech
        mediaPlayerSpeech = new MediaPlayer();
        mediaPlayerSpeech.setAudioAttributes(
                new AudioAttributes.Builder()
                        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                        .setUsage(AudioAttributes.USAGE_MEDIA)
                        .build()

        );


        mediaPlayerSpeech.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
            @Override
            public void onPrepared(MediaPlayer mp) {
                // send command to USB
                if (!currentGestureAndSentence.mCommands.equals("")) {
                    String data = currentGestureAndSentence.mCommands;
                    if (usbService != null) { // if UsbService was correctly binded, Send data
                        usbService.write(data.getBytes());
                        //Log.i(USB_DEBUG, "Przesłane do USB komendy: " + data);
                        //currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
                        //textView.setText(textView.getText().toString() + currentTime + ' ' + USB_DEBUG + ": Przesłane do USB komendy: " + data + '\n');

                    } else {
                        Log.e(USB_DEBUG, "Brak połączenia z USB");
                        currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
                        textView.setText(textView.getText().toString() + currentTime + ' ' + USB_DEBUG + ": Brak połączenia z USB" + '\n');
                    }
                } else {
                    //Log.i(USB_DEBUG, "--- Brak komend do USB ---");
                    //currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
                    //textView.setText(textView.getText().toString() + currentTime + ' ' + USB_DEBUG + ": --- Brak komend do USB ---" + '\n');
                }

                mediaPlayerSpeech.start();
                //Log.i(MEDIA_PLAYER_DEBUG, "Rozpoczęto odtwarzanie bieżącej sentencji");
                //currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
                //textView.setText(textView.getText().toString() + currentTime + ' ' + MEDIA_PLAYER_DEBUG + ": Rozpoczęto odtwarzanie bieżącej sentencji" + '\n');

            }

        });

        mediaPlayerSpeech.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {
                stopSpeaking();
                prepareAndStartNextSentence();
                Log.i(MEDIA_PLAYER_DEBUG, "Zakończone odtwarzanie bieżącej sentencji");
                currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
                textView.setText(textView.getText().toString() + currentTime + ' ' + MEDIA_PLAYER_DEBUG + ": Zakończone odtwarzanie bieżącej sentencji" + '\n');
            }
        });

        // ------- initialize runnable to animate eyes movement
        timerHandlerEyesMovement = new Handler();
        repetitiveRunnableEyesMovement = new Runnable() {
            @Override
            public void run() {
                if (eyesMoveEnabled) {
                    moveEyes();
                }
                timerHandlerEyesMovement.postDelayed(repetitiveRunnableEyesMovement, 500);
            }
        };
        repetitiveRunnableEyesMovement.run();

        // ------- initialize runnable to animate speech
        timerHandlerSpeechMovement = new Handler();
        repetitiveRunnableSpeechMovement = new Runnable() {
            @Override
            public void run() {
                if (isMouthSpeaking) {
                    showNextImageSpeakingMouth();
                }
                timerHandlerSpeechMovement.postDelayed(repetitiveRunnableSpeechMovement, 50);
            }
        };
        repetitiveRunnableSpeechMovement.run();


        visualiser = new Visualizer(mediaPlayerSpeech.getAudioSessionId());
        visualiser.setDataCaptureListener(this, Visualizer.getMaxCaptureRate(), true, false);
        visualiser.setCaptureSize(CAPTURE_SIZE);
        visualiser.setScalingMode(Visualizer.SCALING_MODE_AS_PLAYED); // when not set, noise disturbs with detecting silence, because values are normalized by default
        visualiser.setEnabled(true);


        registerForContextMenu(imageViewTop);
    }

    @Override
    public void onResume() {
        super.onResume();
        setFilters();  // Start listening notifications from UsbService
        startService(UsbService.class, usbConnection, null); // Start UsbService(if it was not started before) and Bind it
    }

    @Override
    public void onPause() {
        super.onPause();
        unregisterReceiver(mUsbReceiver);
        unbindService(usbConnection);
    }

//    @Override
//    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
//        super.onCreateContextMenu(menu, v, menuInfo);
//        // you can set menu header with title icon etc
//        // menu.setHeaderTitle("Choose... ");
//        // add menu items
//        menu.add(0, v.getId(), 0, getString(R.string.context_menu_1));
//        menu.add(0, v.getId(), 0, getString(R.string.context_menu_2));
//    }

    public void showDialog(View view){
//        AlertDialog.Builder alert = new AlertDialog.Builder(this);
//        alert.setMessage(R.string.dialog_message);
//        alert.setPositiveButton(R.string.dialog_start, new DialogInterface.OnClickListener() {
//            @Override
//            public void onClick(DialogInterface dialog, int which) {
//                // get the list of sentences
//                listGesturesAndSentences = mDbManager.getListGesturesAndSentences();
//
//                // prepare first sentence
//                sentenceNumber = mDbManager.getFirstSentenceNo();
//                if (sentenceNumber >= 0) {
//                    sentenceNumber--;
//                } else {
//                    Log.e(MAIN_ACTIVITY, getString(R.string.message_2));
//                }
//                prepareAndStartNextSentence();
//
//
//            }
//        });
//        alert.setNegativeButton(R.string.dialog_stop, new DialogInterface.OnClickListener() {
//            @Override
//            public void onClick(DialogInterface dialog, int which) {
//                // stop sentences
//                stopSpeaking();
//            }
//        });
//        alert.setCancelable(true);
//
//
//        String str = getString(R.string.dialog_message);
//        final ScrollView s_view = new ScrollView(getApplicationContext());
//        final TextView t_view = new TextView(getApplicationContext());
//        t_view.setText(str);
//        t_view.setTextSize(40);
//        s_view.addView(t_view);
//        alert.setTitle("Upgrade notes!");
//        alert.setView(s_view);
//
//        alert.create().show();


        AlertDialog dialog = new AlertDialog.Builder(this)
                //.setTitle("Gasolina")
                //.setMessage(R.string.dialog_message)
                .setNegativeButton(R.string.dialog_stop, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        // stop sentences
                        stopSpeaking();
                    }
                })
                .setPositiveButton(R.string.dialog_start, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        // get the list of sentences
                        listGesturesAndSentences = mDbManager.getListGesturesAndSentences();

                        // prepare first sentence
                        sentenceNumber = mDbManager.getFirstSentenceNo();
                        if (sentenceNumber >= 0) {
                            sentenceNumber--;
                        } else {
                            Log.e(MAIN_ACTIVITY, getString(R.string.message_2));
                        }
                        prepareAndStartNextSentence();
                    }
                })
                .show();
        TextView textView1 = (TextView) dialog.findViewById(android.R.id.button1);
        textView1.setTextSize(20);

        TextView textView2 = (TextView) dialog.findViewById(android.R.id.button2);
        textView2.setTextSize(20);

        TextView textView3 = (TextView) dialog.findViewById(android.R.id.button3);
        textView3.setTextSize(20);
    }


//    @Override
//    public boolean onContextItemSelected(MenuItem item) {
//
//        if (item.getTitle() == getString(R.string.context_menu_1)) {
//            // get the list of sentences
//            listGesturesAndSentences = mDbManager.getListGesturesAndSentences();
//
//            // prepare first sentence
//            sentenceNumber = mDbManager.getFirstSentenceNo();
//            if (sentenceNumber >= 0) {
//                sentenceNumber--;
//            } else {
//                Log.e(MAIN_ACTIVITY, getString(R.string.message_2));
//                return false;
//            }
//            prepareAndStartNextSentence();
//
//        } else if (item.getTitle() == getString(R.string.context_menu_2)) {
//            // stop sentences
//            stopSpeaking();
//        }
//        return true;
//    }


    // prepare & play, because preparing raises playing
    private void prepareAndStartNextSentence() {
        this.sentenceNumber++;
        if (sentenceNumber >= listGesturesAndSentences.size()) {
            sentenceNumber = mDbManager.getFirstSentenceNo(); // repeat from beginning
            if (sentenceNumber >= 0) {
                //sentenceNumber--;
            } else {
                Log.e(MAIN_ACTIVITY, getString(R.string.message_2));
                sentenceNumber = -1;
                return;
            }
        }

        this.currentGestureAndSentence = listGesturesAndSentences.get(this.sentenceNumber);
        String audioPath = PATH + this.currentGestureAndSentence.mSentenceName + ".mp3";
        mMood = this.currentGestureAndSentence.mMood;

        Log.i(MEDIA_PLAYER_DEBUG, "Przygotowanie sentencji: " + this.currentGestureAndSentence.mSentenceName);
        Log.i(MEDIA_PLAYER_DEBUG, "Ustawienie humoru: " + this.currentGestureAndSentence.mMood);

        currentTime = new SimpleDateFormat("HH:mm:ss", Locale.getDefault()).format(new Date());
        textView.setText(textView.getText().toString() + currentTime + ' ' + MEDIA_PLAYER_DEBUG + ": Przygotowanie sentencji: " + this.currentGestureAndSentence.mSentenceName + '\n');
        textView.setText(textView.getText().toString() + currentTime + ' ' + MEDIA_PLAYER_DEBUG + ": Ustawienie humoru: " + this.currentGestureAndSentence.mMood + '\n');

        try {
            mediaPlayerSpeech.reset();
            mediaPlayerSpeech.setDataSource((String) audioPath);
            mediaPlayerSpeech.prepare(); // play starts on event onPrepared
        } catch (Exception e) {
            // TODO log
            Log.d("MM", e.toString());
        }

    }

    // random movement of eyes
    public void moveEyes(){
        if(mMood.equals(Mood.GOOD)) {
            int random = new Random().nextInt(15) + 1; // [0, 14] + 1 => [1, 15]
            if (random == 1) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_prawo);
            } else if (random == 2) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_prawo_dol);
            } else if (random == 3) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_lewo);
            } else if (random == 4) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_lewo_dol);
            } else { // (most common is "look straight")
                this.imageViewTop.setImageResource(R.drawable.oczy_1);
            }
        } else if (mMood.equals(Mood.BAD)) {
            int random = new Random().nextInt(15) + 1; // [0, 14] + 1 => [1, 15]
            if (random == 1) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_prawo);
            } else if (random == 2) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_prawo_dol);
            } else if (random == 3) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_lewo);
            } else if (random == 4) {
                this.imageViewTop.setImageResource(R.drawable.oczy_w_lewo_dol);
            } else { // (most common is "look straight")
                this.imageViewTop.setImageResource(R.drawable.oczy_1);
            }
        } else if (mMood.equals(Mood.CRY)){
            int random = new Random().nextInt(2) + 1; // [0, 1] + 1 => [1, 2]
            if (random == 1) {
                this.imageViewTop.setImageResource(R.drawable.oczy_placz_1);
            } else if (random == 2) {
                this.imageViewTop.setImageResource(R.drawable.oczy_placz_2);
            }
        }
    }



    private void showNextImageSpeakingMouth(){
        if(mMood.equals(Mood.GOOD)){
            int random = new Random().nextInt(3);
            if (random == 0){
                this.imageViewBottom.setImageResource(R.drawable.usta_usmiech_1);
            } else if (random == 1){
                this.imageViewBottom.setImageResource(R.drawable.usta_usmiech_2);
            } else if (random == 2){
                this.imageViewBottom.setImageResource(R.drawable.usta_usmiech_3);
            }
        }else if (mMood.equals(Mood.BAD) || mMood.equals(Mood.CRY)){
            int random = new Random().nextInt(3);
            if (random == 0){
                this.imageViewBottom.setImageResource(R.drawable.usta_usmiech_1);
            } else if (random == 1){
                this.imageViewBottom.setImageResource(R.drawable.usta_otwarte_wysoko);
            } else if (random == 2){
                this.imageViewBottom.setImageResource(R.drawable.usta_otwarte_szeroko);
            }
        }
    }


    private void stopSpeaking(){
        this.isMouthSpeaking = false;
        //mMood = Mood.GOOD;
        if (mediaPlayerSpeech.isPlaying()){
            mediaPlayerSpeech.stop();
        }

        if (mMood.equals(Mood.GOOD)) {
            this.imageViewBottom.setImageResource(R.drawable.usta_usmiech_3);
        } else if (mMood.equals(Mood.BAD)) {
            this.imageViewBottom.setImageResource(R.drawable.usta_zmartwienie1);
        } else if (mMood.equals(Mood.CRY)) {
            this.imageViewBottom.setImageResource(R.drawable.usta_skrzywione1);
        }

    }

    @Override
    public void onWaveFormDataCapture(Visualizer iVisualizer, byte[] waveform, int samplingRate) {

        // Start speeking when the voice is loud enough
       //byte[] bytes = new byte[CAPTURE_SIZE];
        iVisualizer.getWaveForm(waveform);
        int maxVal = -128;
        for (byte b: waveform){

            if (b > maxVal && b < 127)
                maxVal = b;
        }

        //textViewWaveForm.setText(String.valueOf(maxVal));

        if (maxVal > 0){ // open the mouth only when the max. amplitude is high enough
            this.isMouthSpeaking = true;
            //showNextImageSpeakingMouth();
        } else
        {
            //stopSpeaking(); // the amplitude is too low
            this.isMouthSpeaking = false;
        }
}

    @Override
    public void onFftDataCapture(Visualizer visualizer, byte[] fft, int samplingRate) {
        // not used
    }



    private void startService(Class<?> service, ServiceConnection serviceConnection, Bundle extras) {
        if (!UsbService.SERVICE_CONNECTED) {
            Intent startService = new Intent(this, service);
            if (extras != null && !extras.isEmpty()) {
                Set<String> keys = extras.keySet();
                for (String key : keys) {
                    String extra = extras.getString(key);
                    startService.putExtra(key, extra);
                }
            }
            startService(startService);
        }
        Intent bindingIntent = new Intent(this, service);
        bindService(bindingIntent, serviceConnection, Context.BIND_AUTO_CREATE);
    }

    private void setFilters() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(UsbService.ACTION_USB_PERMISSION_GRANTED);
        filter.addAction(UsbService.ACTION_NO_USB);
        filter.addAction(UsbService.ACTION_USB_DISCONNECTED);
        filter.addAction(UsbService.ACTION_USB_NOT_SUPPORTED);
        filter.addAction(UsbService.ACTION_USB_PERMISSION_NOT_GRANTED);
        registerReceiver(mUsbReceiver, filter);
    }



    /*
     * This handler will be passed to UsbService. Data received from serial port is displayed through this handler
     */
    private static class MyHandler extends Handler {
        private final WeakReference<MainActivity> mActivity;

        public MyHandler(MainActivity activity) {
            mActivity = new WeakReference<>(activity);
        }

        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case UsbService.MESSAGE_FROM_SERIAL_PORT:
                    String data = (String) msg.obj;
                    mActivity.get().dataReceivedFromUsb = data;
                    break;
                case UsbService.CTS_CHANGE:
                    Toast.makeText(mActivity.get(), "CTS_CHANGE",Toast.LENGTH_LONG).show();
                    break;
                case UsbService.DSR_CHANGE:
                    Toast.makeText(mActivity.get(), "DSR_CHANGE",Toast.LENGTH_LONG).show();
                    break;
            }
        }
    }


}
