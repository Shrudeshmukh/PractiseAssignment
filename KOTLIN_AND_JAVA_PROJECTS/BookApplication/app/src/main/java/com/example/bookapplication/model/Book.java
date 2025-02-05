package com.example.bookapplication.model;

import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity
public class Book {

    @PrimaryKey(autoGenerate = true)
    private int bookId;

    private String bookTitle;

    private String bookAuthor;

    public Book(String bookTitle,String bookAuthor){
        this.bookId=bookId;
        this.bookTitle=bookTitle;
        this.bookAuthor=bookAuthor;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookTitle='" + bookTitle + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                '}';
    }
}
