//
//  TransactionFormView.swift
//  BudgetTrackerApp
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct TransactionFormView: View {
    @EnvironmentObject var transcationStore : TransactionStore
    @Environment(\.presentationMode) var presentationMode
    
    @State private var amount: String = ""
    @State private var catagory: String = "Income"
    @State private var descrpition: String = ""
    
    let catagories = ["Income", "Expense"]
    
    var body: some View {
        Form{
            Section(header:Text("Transaction Details")){
                TextField("Amount",text:$amount).keyboardType(.decimalPad)
                TextField("Description",text:$descrpition)
                Picker("Catagory",selection: $catagory){
                    ForEach(catagories,id:\.self){
                        cat in Text(cat)
                    }
                }
                Button (action:{
                    saveTransaction()
                    
                }){
                   Text("Save Transaction")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.mint)
                        .foregroundColor(Color.white)
                }
            }
            .navigationTitle("New Transaction")
            .navigationBarBackButtonHidden(false)
            
        }
            }
    
    func saveTransaction(){
        guard let transactionAmount = Double(amount)else{
            print("Invalid Amount")
            return
        }
        let transaction=Transaction(amount:transactionAmount,catagory: catagory,description: descrpition)
        print("Saved Transaction :\(transaction)")
        print("Before saving : \(transcationStore.transactions)")
        transcationStore.transactions.append(transaction)
        print("after saving : \(transcationStore.transactions)")
        presentationMode.wrappedValue.dismiss()
        

        
    }
}


struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}
