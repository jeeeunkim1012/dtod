package com.cookandroid.dtodproject;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.graphics.Color;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.VideoView;

public class MainActivity extends AppCompatActivity {
    private VideoView wineVideo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        wineVideo = findViewById(R.id.wineVideo);

        // 동영상 파일의 경로를 설정 (res/raw 디렉토리에 추가한 동영상 파일)
        String videoPath = "android.resource://" + getPackageName() + "/" + R.raw.wine3;

        // VideoView에 동영상 파일 설정
        wineVideo.setVideoURI(Uri.parse(videoPath));

        // 동영상이 준비되면 재생을 시작하고 반복 재생 설정
        wineVideo.setOnPreparedListener(mp -> {
            mp.setLooping(true);
            wineVideo.start();
        });

        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.drawable.ic_launcher_foreground);
        setTitle("술결 기획전");
        final GridView gv = (GridView) findViewById(R.id.gridview1);
        MyGridAdapter gAdapter = new MyGridAdapter(this);
        gv.setAdapter(gAdapter);


    }

    public class MyGridAdapter extends BaseAdapter{

        Context context;

        public MyGridAdapter(Context context) {
            this.context = context;
        }

        Integer[] posterID = {R.drawable.exhibitions1, R.drawable.exhibitions2, R.drawable.exhibitions3, R.drawable.exhibitions4, R.drawable.exhibitions5, R.drawable.exhibitions6};

        // 다이얼로그 팝업창의 Title 내용에 들어갈 posterTitle 배열 내용을 정의함
        String[] posterTitle = { "기획전 이미지1", "기획전 이미지2", "기획전 이미지3", "기획전 이미지4", "기획전 이미지5", "기획전 이미지6"};
        @Override
        public int getCount() {
            return posterID.length;
        }

        @Override
        public Object getItem(int i) {
            return null;
        }

        @Override
        public long getItemId(int i) {
            return 0;
        }

        // 아래 int 타입의 i 파라미터를 position 파라미터로 수정(변경) 코딩 하시기 바랍니다.
        @Override
        public View getView(int position, View view, ViewGroup viewGroup) {
            ImageView imageView = new ImageView(context);
            imageView.setLayoutParams(new ViewGroup.LayoutParams(600, 890));
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView.setPadding(5,10,0,0);
            imageView.setImageResource(posterID[position]);

            final int pos = position;
            imageView.setOnClickListener(new View.OnClickListener(){
                @Override
                public void onClick(View view){
                    View dialogView = (View) view.inflate(MainActivity.this, R.layout.exhibitions, null);
                    AlertDialog.Builder dlg = new AlertDialog.Builder(MainActivity.this);
                    ImageView ivPoster = (ImageView) dialogView.findViewById(R.id.exPoster);
                    ivPoster.setImageResource(posterID[pos]);
                    // 다이얼로그 팝업창의 Title 내용에 posterTitle 배열 내용 적용함
                    dlg.setTitle("술결 : " + posterTitle[pos]);
                    dlg.setIcon(R.drawable.exhibitions1);
                    dlg.setView(dialogView);
                    dlg.setNegativeButton("닫기", null);
                    dlg.show();

                }
            });

            return imageView;
        }
    }

}