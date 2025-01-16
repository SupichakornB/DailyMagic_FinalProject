//
//  state.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//

import Foundation

final class StateController : ObservableObject {
    @Published var account: Account = TestData.account
    
    func add(_ transaction: Transaction) {
        account.add(transaction)
    }
}

struct TestData {
    static let transactions: [Transaction] = [
//        Transaction(amount: 200000, date: Date(), description: "Salary", category: .income),
//        Transaction(amount: -1999, date: Date(), description: "Cellphone", category: .cash),
//        Transaction(amount: -5687, date: Date(), description: "Supermarket", category: .groceries)
    ]
    
    static let account = Account(transactions: transactions)
}
