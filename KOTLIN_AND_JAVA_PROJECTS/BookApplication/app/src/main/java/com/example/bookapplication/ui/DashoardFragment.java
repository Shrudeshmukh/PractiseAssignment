package com.example.bookapplication.ui;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.example.bookapplication.R;
import com.example.bookapplication.appdatabase.AppDatabase;
import com.example.bookapplication.appdatabase.BookDao;
import com.example.bookapplication.model.Book;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;

public class DashoardFragment extends Fragment {

    EditText nameBook,authorBook;
    Button addBook,deleteBook,updateBook,viewBook;
    ListView lvBookHistory;

    ArrayAdapter<String>bookHistoryAdaptor;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view= inflater.inflate(R.layout.fragment_dashoard, container, false);
        nameBook=view.findViewById(R.id.nameBook);
        authorBook=view.findViewById(R.id.authorBook);
        addBook=view.findViewById(R.id.addBook);
        deleteBook=view.findViewById(R.id.deleteBook);
        updateBook=view.findViewById(R.id.updateBook);
        viewBook=view.findViewById(R.id.viewBook);
        lvBookHistory=view.findViewById(R.id.lvBookHistory);

        AppDatabase db= AppDatabase.getInstance(getContext());

        addBook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String bookTitle=nameBook.getText().toString();
                String bookAuthor= authorBook.getText().toString();
                if(bookTitle.isEmpty()|| bookAuthor.isEmpty()){
                    Toast.makeText(getContext(),"Fill the required fields",Toast.LENGTH_SHORT).show();
                }
                Book book=new Book(bookTitle,bookAuthor);
                Executors.newSingleThreadExecutor().execute(()->{
                    db.bookDao().insertBook(book);
                });
                nameBook.setText("");
                authorBook.setText("");
                Toast.makeText(getContext(), "Book Added successfully", Toast.LENGTH_SHORT).show();
            }
        });

        updateBook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FragmentManager fragmentManager= getParentFragmentManager();
                FragmentTransaction fragmentTransaction= fragmentManager.beginTransaction();
                fragmentTransaction.replace(R.id.frame_layout,new UpdateFragment()).commit();
            }
        });

        bookHistoryAdaptor=new ArrayAdapter<>(getContext(), android.R.layout.simple_list_item_1,new ArrayList<>());
        lvBookHistory.setAdapter(bookHistoryAdaptor);

        viewBook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ArrayList<Book>bookHistoryList= new ArrayList<>();

                Executors.newSingleThreadExecutor().execute(()->{
                    List<Book> bookList=db.bookDao().getAllBooks();
                    getActivity().runOnUiThread(()->{
                        for (Book book:bookList) {
                          bookHistoryList.add(book.toString());
                        }
                        bookHistoryAdaptor.clear();
                        bookHistoryAdaptor.addAll(bookHistoryList);
                        bookHistoryAdaptor.notifyDataSetChanged();

                    });
                });
            }
        });

        return view;


    }
}