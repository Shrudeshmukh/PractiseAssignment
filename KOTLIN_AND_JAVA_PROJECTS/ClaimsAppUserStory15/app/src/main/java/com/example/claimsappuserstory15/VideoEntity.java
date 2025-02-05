package com.example.claimsappuserstory15;

import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "video_table")
class VideoEntity {
    @PrimaryKey(autoGenerate = true)
    public int id;

    public String videoPath;

    public VideoEntity(String videoPath) {
        this.videoPath = videoPath;
    }
}
