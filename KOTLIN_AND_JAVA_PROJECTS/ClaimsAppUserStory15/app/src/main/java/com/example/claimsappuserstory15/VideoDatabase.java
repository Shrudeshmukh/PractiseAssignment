package com.example.claimsappuserstory15;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;

@Database(entities = {VideoEntity.class}, version = 1, exportSchema = false)
abstract class VideoDatabase extends  RoomDatabase {
    public abstract VideoDao videoDao();

    private static VideoDatabase instance;

    public static synchronized VideoDatabase getInstance(Context context){
        if(instance == null){
            instance = Room.databaseBuilder(context.getApplicationContext(), VideoDatabase.class, "video_database").build();
        }
        return  instance;
    }
}