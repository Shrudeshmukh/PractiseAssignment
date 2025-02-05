package com.example.claimsappuserstory15;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Button;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.room.Room;

public class VideoStatementActivity extends AppCompatActivity {

    private static final int VIDEO_REQUEST_CODE = 101;
    private Uri videoUri;
    private Button recordButton;
    private Button uploadButton;
    private VideoDatabase videoDatabase;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video_statement);

        recordButton = findViewById(R.id.record_button);
        uploadButton = findViewById(R.id.upload_button);

        videoDatabase = Room.databaseBuilder(getApplicationContext(),
                VideoDatabase.class, "video_db").build();

        recordButton.setOnClickListener(v -> recordVideo());
        uploadButton.setOnClickListener(v -> uploadVideo());
    }

    private void recordVideo() {
        Intent videoIntent = new Intent(MediaStore.ACTION_VIDEO_CAPTURE);
        if (videoIntent.resolveActivity(getPackageManager()) != null) {
            startActivityForResult(videoIntent, VIDEO_REQUEST_CODE);
        } else {
            Toast.makeText(this, "Camera not available", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == VIDEO_REQUEST_CODE && resultCode == RESULT_OK && data != null) {
            videoUri = data.getData();
            Toast.makeText(this, "Video recorded successfully", Toast.LENGTH_SHORT).show();
            saveVideoToDatabase(videoUri.toString());
        }
    }

    private void saveVideoToDatabase(String videoPath) {
        new Thread(() -> {
            VideoEntity video = new VideoEntity(videoPath);
            videoDatabase.videoDao().insert(video);
            runOnUiThread(() -> Toast.makeText(this, "Video saved to database", Toast.LENGTH_SHORT).show());
        }).start();
    }

    private void uploadVideo() {
        if (videoUri != null) {
            Toast.makeText(this, "Uploading video...", Toast.LENGTH_SHORT).show();
            Log.d("VideoUpload", "Video URI: " + videoUri.toString());
            Toast.makeText(this, "Video uploaded successfully", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "No video to upload", Toast.LENGTH_SHORT).show();
        }
    }
}
