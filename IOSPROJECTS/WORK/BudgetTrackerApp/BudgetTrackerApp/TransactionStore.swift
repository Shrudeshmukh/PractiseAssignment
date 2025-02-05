//
//  TransactionStore.swift
//  BudgetTrackerApp
//
//  Created by admin on 28/01/25.
//

import Foundation

struct Transaction: Identifiable{
    let id=UUID()
    let amount:Double
    let catagory: String
    let description:String
}

class TransactionStore:ObservableObject{
    @Published var transactions:[Transaction]=[]
    
    var totalIncome:Double{
        transactions.filter{$0.catagory=="Income"}.reduce(0){$0+$1.amount}
    }
    
    var totalExpense:Double{
        transactions.filter{$0.catagory=="Expense"}.reduce(0){$0+$1.amount}
    }
    
    var currentBalance: Double{
        totalIncome-totalExpense
    }
    


}
