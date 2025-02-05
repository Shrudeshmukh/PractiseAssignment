//
//  AddTransactionView.swift
//  BudgetTrackerNew
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var amount = ""
    @State private var catagory = ""
   
    @State private var desc = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Transaction Details")){
                    TextField("Enter Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    TextField("Enter Description", text: $desc)
                    
                    Picker("Category", selection: $catagory){
                        Text("Income").tag("income")
                        Text("Expense").tag("expense")
                    }
                }
                .navigationBarTitle("Add New Transaction", displayMode: .inline)
                .navigationBarItems(
                    leading: Button("Cancel"){
                        dismiss()
                    },
                    trailing: Button("Save"){
                        addTransaction()
                        dismiss()
                    }
                        .disabled(amount.isEmpty)
                )
                
            }
        }
    }
            private func addTransaction() {
                let newTransaction = Transactions(context: viewContext)
                
                newTransaction.catagory = catagory
                newTransaction.desc = desc
                newTransaction.id = UUID()
                
                if let isDouble = Double(amount){
                    newTransaction.amount = isDouble
                }
                else{
                    newTransaction.amount = 0.0
                }
                
                do {
                    try viewContext.save()
                    desc = ""
                    amount = ""
                    catagory = ""
                } catch {
                    print("Error saving Transaction: \(error)")
                }
            }
        }
    

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
    }
}
