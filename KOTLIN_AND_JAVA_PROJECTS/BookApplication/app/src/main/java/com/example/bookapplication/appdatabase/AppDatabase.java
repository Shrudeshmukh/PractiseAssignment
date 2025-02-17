package com.example.bookapplication.appdatabase;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;

import com.example.bookapplication.model.Book;

@Database(entities = {Book.class},version = 1)
public abstract class AppDatabase extends RoomDatabase {

    public abstract BookDao bookDao();

    private static AppDatabase instance;

    public static synchronized AppDatabase getInstance(Context context) {

        if (instance ==null) {
          instance=Room.databaseBuilder(context.getApplicationContext(),AppDatabase.class,"book_database").build();
        }
       return instance;
    }

}
