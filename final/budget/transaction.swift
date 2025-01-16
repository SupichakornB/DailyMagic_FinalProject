//
//  transaction.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//


import SwiftUI

struct TransactionView: View {
    @State private var amount: String = ""
    @State private var selectedCategory: Transaction.Category = .transfer
    @State private var description: String = ""
    
    @EnvironmentObject private var stateController: StateController
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            TransactionContent(amount: $amount, selectedCategory: $selectedCategory, description: $description)
                .navigationBarTitle("New Transaction").foregroundColor(Color(red: 176/255, green: 87/255, blue: 141/255))
                .navigationBarItems(leading: Button(action: { self.dismiss() }) {
                    Text("Cancel").foregroundColor(Color(red: 250/255, green: 180/255, blue: 202/255))
                    }, trailing: Button(action: addTransaction) {
                        Text("Add")
                            .bold().foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
                })
        }
    }
}

private extension TransactionView {
    func addTransaction() {
        let sign = selectedCategory == .income ? 1 : -1
        let transaction = Transaction(amount: Int(amount)! * 100 * sign, date: Date(), description: description, category: selectedCategory)
        stateController.add(transaction)
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

//content
struct TransactionContent: View {
    @Binding var amount: String
    @Binding var selectedCategory: Transaction.Category
    @Binding var description: String
    
    var body: some View {
        List {
            Amount(amount: $amount)
            CategorySelection(selectedCatergory: $selectedCategory)
                .buttonStyle(PlainButtonStyle())
            TextField("Description", text: $description)
        }
    }
}

//amount
struct Amount: View {
    @Binding var amount: String
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Amount")
                .font(.callout)
                .bold()
                .foregroundColor(Color(red: 250/255, green: 160/255, blue: 187/255))
            TextField(0.currencyFormat, text: $amount)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .font(Font.largeTitle.bold())
                .foregroundColor(Color(red: 217/255, green: 136/255, blue: 185/255))
        }
        .padding()
    }
}

//selection
struct CategorySelection: View {
    @Binding var selectedCatergory: Transaction.Category
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(Transaction.Category.allCases) { category in
                CategoryButton(category: category, selected: category == self.selectedCatergory, action: { self.selectedCatergory = category })
                Spacer()
            }
        }
        .padding()
    }
}

//category
struct CategoryButton: View {
    let category: Transaction.Category
    var selected: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                categoryView(category: category, highlighted: selected)
                Text(category.name)
                    .font(.headline)
                    .foregroundColor(selected ? Color(red: 250/255, green: 160/255, blue: 187/255): Color(red: 250/255, green: 160/255, blue: 187/255))
            }
        }
    }
}


struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionView()
            TransactionContent(amount: .constant(""), selectedCategory: .constant(.transfer), description: .constant(""))
            Group {
                Amount(amount: .constant(""))
                CategorySelection(selectedCatergory: .constant(.transfer))
                HStack {
                    CategoryButton(category: .transfer, action: {})
                    CategoryButton(category: .transfer, selected: true, action: {})
                }
                .padding()
            }
            .previewLayout(.sizeThatFits)
        }
    }
}
