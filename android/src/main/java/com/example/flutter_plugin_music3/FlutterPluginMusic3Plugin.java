package com.example.flutter_plugin_music3;

import android.app.Activity;
import android.media.MediaPlayer;
import android.net.Uri;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterPluginMusic3Plugin
 */
public class FlutterPluginMusic3Plugin implements MethodCallHandler {
    private static final String TAG = "FlutterPluginMusic3Plug";
    private Activity activity;
    private MediaPlayer mediaPlayer;

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_music3");
        channel.setMethodCallHandler(new FlutterPluginMusic3Plugin(registrar.activity()));
    }

    public void loadAudio(final String url) throws Exception {
        if (mediaPlayer == null) {
            mediaPlayer = MediaPlayer.create(activity , Uri.parse(url));
            mediaPlayer.setLooping(true);
        }
    }

    private void startAudio() {
        mediaPlayer.start();
    }

    private void pauseAudio(){
        mediaPlayer.pause();
    }

    private FlutterPluginMusic3Plugin(Activity activity){
        this.activity = activity;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {

        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
            try {
                loadAudio("https://firebasestorage.googleapis.com/v0/b/crypto-topic-244009.appspot.com/o/iphone_basic_ring.mp3?alt=media&token=2f00147d-0e10-4bbc-8040-3ea45e13b413");
            } catch (Exception e) {
                e.printStackTrace();
                Log.d(TAG, "onMethodCall: ERROR -----" + e.getMessage());
            }
        } else if (call.method.equals("payAudio")) {
            startAudio();

        } else if (call.method.equals("pauseAudio")) {
            pauseAudio();

        } else {
            result.notImplemented();
        }
    }

}
