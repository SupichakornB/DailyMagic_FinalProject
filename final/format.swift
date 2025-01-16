//
//  format.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//

import Foundation

extension Int {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: Float(self) / 100 )) ?? ""
    }
}

extension Date {
    var transactionFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

extension Transaction.Category {
    var name: String {
        rawValue.capitalized
    }
    
    var imageName: String {
        switch self {
        case .transfer: return "creditcard.fill"
        case .income: return "hand.thumbsup.fill"
        case .cash: return "banknote.fill"
        }
    }
}
