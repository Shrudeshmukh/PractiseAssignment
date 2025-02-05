//
//  EditTransactionView.swift
//  BudgetTrackerNew
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct EditTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
       @Environment(\.dismiss) private var dismiss

       @ObservedObject var transaction: Transactions
       @State private var amount = ""
       @State private var desc = ""

       var body: some View {
           NavigationView {
               Form {
                   Section(header: Text("Edit Transaction")) {
                       TextField("Edit Amount", text: $amount)
                       TextField("Edit Description", text: $desc)
                   }
               }
               .navigationBarTitle("Edit Transaction", displayMode: .inline)
               .navigationBarItems(
                   leading: Button("Cancel") {
                       dismiss()
                   },
                   trailing: Button("Update") {
                       if let isDouble = Double(amount){
                           transaction.amount=isDouble
                       }else{
                           transaction.amount = 0.0
                       }
                    transaction.desc = desc
                       saveContext()
                       dismiss()
                   }.disabled(amount.isEmpty)
               )
               .onAppear {
                   amount = String(format: "%.2f",transaction.amount)
                   desc = transaction.desc ?? ""
               }
           }
       }

       private func saveContext() {
           do {
               try viewContext.save()
           } catch {
               print("Error saving context: \(error)")
           }
       }
   }


