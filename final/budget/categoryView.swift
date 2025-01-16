//
//  category.swift
//  final
//
//  Created by Supichakorn Boonkasem on 8/12/2566 BE.
//


import SwiftUI

struct categoryView: View {
    let category: Transaction.Category
    var highlighted: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 56.0, height: 56.0)
                .foregroundColor(highlighted ? Color(.systemTeal) : Color(.quaternarySystemFill))
            Image(systemName: category.imageName)
                .font(.headline)
                .foregroundColor(highlighted ? .white : Color(red: 250/255, green: 160/255, blue: 187/255))
        }
    }
}

struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ForEach(Transaction.Category.allCases, id: \.rawValue) { category in
                VStack {
                    categoryView(category: category)
                    categoryView(category: category, highlighted: false)
                }
            }
        }.previewLayout(.sizeThatFits)
    }
}

