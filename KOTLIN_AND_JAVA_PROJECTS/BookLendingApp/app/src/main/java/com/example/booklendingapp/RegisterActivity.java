package com.example.booklendingapp;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class RegisterActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_register);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        //access the spinner component
        Spinner countrySpiner = findViewById(R.id.spinnerCountry);
        Spinner citySpiner = findViewById(R.id.spinnerCity);


        String[] countries = {"India","Sri Lanka"};



        //data for spinner
        ArrayAdapter<CharSequence> adpater = ArrayAdapter.createFromResource(
                this, R.array.countries,
                android.R.layout.simple_spinner_item
        );



        ArrayAdapter<CharSequence> cityAdpater = ArrayAdapter.createFromResource(
                this, R.array.cities,
                android.R.layout.simple_spinner_item
        );

        ArrayAdapter<String> strAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item,countries);

        //map spinner and data
        //  countrySpiner.setAdapter(adpater);
        citySpiner.setAdapter(cityAdpater);
        countrySpiner.setAdapter(strAdapter);


        Button cancelButton = findViewById(R.id.cancel);
        Button shareButton = findViewById(R.id.share);


        cancelButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //launch the Registeration Activity - Explicit
                Intent intent = new Intent(RegisterActivity.this,LoginActivity.class);
                startActivity(intent);
            }
        });

        shareButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //launch the Registeration Activity - Implicit
                Intent intent = new Intent(Intent.ACTION_SEND);
                intent.setType("text/plain");
                startActivity(Intent.createChooser(intent, "Share Profile Via"));


                startActivity(intent);
            }
        });


    }
}