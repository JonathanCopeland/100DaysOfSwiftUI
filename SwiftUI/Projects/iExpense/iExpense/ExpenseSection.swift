//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Jonathan Copeland on 31/03/2023.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void

    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }

                    Spacer()

                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .style(for: item)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityHint("\(item.name), \(item.amount)")
                
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}
