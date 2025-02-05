package com.example.bookapplication.appdatabase;


import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.Query;
import androidx.room.Update;

import com.example.bookapplication.model.Book;

import java.util.List;

@Dao
public interface BookDao {
    @Insert
    void insertBook(Book book);

    @Query("SELECT * FROM Book")
    List<Book>getAllBooks();

    @Update
    void updateBook(Book book);

    @Delete
    void deleteBook(Book book);

     @Query("SELECT * FROM Book where BookId=  :id")
     Book getBookById(int id);

}
