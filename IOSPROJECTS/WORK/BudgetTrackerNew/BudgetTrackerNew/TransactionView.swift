//
//  TransactionView.swift
//  BudgetTrackerNew
//
//  Created by admin on 30/01/25.
//
import SwiftUI
import CoreData
struct TransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Transactions.entity(),
        sortDescriptors: []
    ) private var transactions: FetchedResults<Transactions>
    

    @State private var showAddView = false
    @State private var postToEdit: Transactions?
    
    var totalIncome: Double {transactions.filter{ $0.catagory == "Income"}.reduce(0) { $0 + $1.amount}}
    var totalExpense: Double {transactions.filter{ $0.catagory == "Expense"}.reduce(0) { $0 + $1.amount}}
    var balance: Double { totalIncome - totalExpense }
    var result:Double{
        transactions.reduce(0){result,transaction in
            if transaction.catagory == "income" {
                return result + transaction.amount
            }else if transaction.catagory == "expense"{
                return result - transaction.amount
                
            }
            return result
            
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Balance: \(result,specifier:"%.2f")").font(.headline).foregroundColor(result>0 ?.green:.red)
                List {
                    ForEach(transactions) { transaction in
                        NavigationLink(destination: EditTransactionView(transaction: transaction)) {
                            
                            HStack {
                                VStack (alignment: .leading){
                                    
                                    Text("\(transaction.amount, specifier: "%.2f")").font(.headline)
                                        .foregroundColor(transaction.catagory == "income" ?.green: .red)
                                    Text(transaction.catagory ?? "no category")
                                        .foregroundColor(transaction.catagory == "income" ?.green: .red)
                                    Text(transaction.desc ?? "No Content")
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // To remove default navigation styling from the list item
                        
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteTransaction(transaction)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationTitle("All Transactions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddView) {
                AddTransactionView()
            }
        }
    }
    
    private func deleteTransaction(_ transaction: Transactions) {
        viewContext.delete(transaction)
        do {
            try viewContext.save()
        } catch {
            print("Error deleting post: \(error)")
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
