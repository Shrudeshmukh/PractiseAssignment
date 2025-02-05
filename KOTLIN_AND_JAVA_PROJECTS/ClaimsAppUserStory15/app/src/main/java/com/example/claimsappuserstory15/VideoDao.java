package com.example.claimsappuserstory15;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

@Dao
interface VideoDao {
    @Insert
    void insert(VideoEntity video);

    @Query("SELECT * FROM video_table")
    List<VideoEntity> getAllVideos();
}