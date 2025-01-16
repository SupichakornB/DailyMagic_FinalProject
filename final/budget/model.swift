//
//  model.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//

import Foundation

struct Transaction: Identifiable {
    enum Category: String, CaseIterable, Identifiable {
        case income, transfer, cash
        var id: String { rawValue }
    }
    
    let id = UUID()
    let amount: Int
    let date: Date
    let description: String
    let category: Category
}

struct Account {
    private (set) var transactions: [Transaction]
    
    var balance: Int {
        var balance = 0
        for transaction in transactions {
            balance += transaction.amount
        }
        return balance
    }
    
    mutating func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}
