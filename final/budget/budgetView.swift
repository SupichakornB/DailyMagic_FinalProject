//
//  budgetView.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//


import SwiftUI

struct BudgetView: View {
    @EnvironmentObject private var stateController: StateController
    @State private var addingNewTransaction = false
    
    var body: some View {
        NavigationView {
            AccountView(account: stateController.account)
                .navigationBarTitle("Budget")
                                .foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
                                .navigationBarItems(trailing: Button(action: { self.addingNewTransaction = true }) {
                                    Image(systemName: "plus")
                                        .font(.title)
                                        .foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
                                })
                .sheet(isPresented: $addingNewTransaction) {
                    TransactionView()
                        .environmentObject(self.stateController)
            }
        }
    }
}

// MARK: - AccountView
struct AccountView: View {
    let account: Account
    
    private var transactions: [final.Transaction] {
        return account
            .transactions
            .sorted(by: { $0.date > $1.date })
    }
    
    var body: some View {
        List {
            Balance(amount: account.balance)
            ForEach(transactions) { transaction in
                RowComponent(transaction: transaction)
            }
        }
    }
}

// MARK: - Balance
struct Balance: View {
    var amount: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Balance")
                .font(.callout)
                .bold()
                .foregroundStyle(Color(red: 250/255, green: 160/255, blue: 187/255))
            Text(amount.currencyFormat)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(Color(red: 250/255, green: 160/255, blue: 187/255))
        }
        .padding(.vertical)
    }
}

// MARK: - Row
struct RowComponent: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 16.0) {
            categoryView(category: transaction.category)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(transaction.category.name)
                    .font(.headline).foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
                Text(transaction.description)
                    .font(.caption)
                    .foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
                
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4.0) {
                Text(transaction.amount.currencyFormat)
                    .font(.headline)
                    .foregroundColor(color(for: transaction.amount))
                Text(transaction.date.transactionFormat)
                    .font(.caption)
                    .foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
            }
        }
        .padding(.vertical)
    }
    
    func color(for amount: Int) -> Color {
        amount > 0 ? Color(red: 250/255, green: 160/255, blue: 187/255): Color(red: 250/255, green: 160/255, blue: 187/255)
    }
}

// MARK: - Previews
struct BudgetView_Previews: PreviewProvider {
    static let account = TestData.account
    
    static var previews: some View {
        Group {
            AccountView(account: account)
            Group {
                Balance(amount: account.balance)
                RowComponent(transaction: account.transactions[0])
            }
            .previewLayout(.sizeThatFits)
        }
    }
}

