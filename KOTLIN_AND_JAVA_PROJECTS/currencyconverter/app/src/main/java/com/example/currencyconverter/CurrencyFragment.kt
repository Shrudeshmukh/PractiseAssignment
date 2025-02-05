package com.example.currencyconverter

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.fragment.app.Fragment

class CurrencyFragment : Fragment() {

    private lateinit var fromCurrencySpinner: Spinner
    private lateinit var toCurrencySpinner: Spinner
    private lateinit var amountEditText: EditText
    private lateinit var resultTextView: TextView
    private val currencies = arrayOf("USD", "EUR", "GBP", "JPY", "INR") // Example currencies

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_currency, container, false)

        fromCurrencySpinner = view.findViewById(R.id.from_currency_spinner)
        toCurrencySpinner = view.findViewById(R.id.to_currency_spinner)
        amountEditText = view.findViewById(R.id.amount_edit_text)
        resultTextView = view.findViewById(R.id.result_text_view)

        // Set up spinners
        val adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_item, currencies)
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        fromCurrencySpinner.adapter = adapter
        toCurrencySpinner.adapter = adapter

        // Set up listeners
        fromCurrencySpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parent: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long
            ) {
                calculateResult()
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                // Do nothing
            }
        }

        toCurrencySpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(
                parent: AdapterView<*>?,
                view: View?,
                position: Int,
                id: Long
            ) {
                calculateResult()
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                // Do nothing
            }
        }

        return view
    }

    private fun calculateResult() {
        val fromCurrency = fromCurrencySpinner.selectedItem.toString()
        val toCurrency = toCurrencySpinner.selectedItem.toString()
        val amountString = amountEditText.text.toString()

        if (amountString.isNotEmpty()) {
            val amount = amountString.toDouble()

            // **Implement your currency conversion logic here**
            // This is a placeholder and needs to be replaced with actual conversion rates
            var result = 0.0

            if (fromCurrency == "USD" && toCurrency == "EUR") {
                result = amount * 0.9 // Example conversion rate
            } else if (fromCurrency == "EUR" && toCurrency == "USD") {
                result = amount * 1.11 // Example conversion rate
            }
            // Add more conversion logic for other currencies

            resultTextView.text = "Result: $result $toCurrency"
        } else {
            resultTextView.text = "Please enter an amount"
        }
    }
}