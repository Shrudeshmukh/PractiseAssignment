//
//  TransactionListView.swift
//  BudgetTracker
//
//  Created by admin on 29/01/25.
//

import SwiftUI
struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionViewModel

    var body: some View {
        List {
            ForEach(Array(viewModel.transactions.enumerated()), id: \ .1.id) { index, transaction in
                NavigationLink(destination: TransactionFormView(viewModel: viewModel, transaction: transaction, transactionIndex: index)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(transaction.title)
                            Text(transaction.type.rawValue)
                                .font(.subheadline)
                                .foregroundColor(transaction.type == .income ? .green : .red)
                        }
                        Spacer()
                        Text("$\(transaction.amount, specifier: "%.2f")")
                    }
                }
            }
            .onDelete(perform: viewModel.deleteTransaction)
        }
        .navigationTitle("Transactions")
        .toolbar {
            EditButton()
        }
    }
}
