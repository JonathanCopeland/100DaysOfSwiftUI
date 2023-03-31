//
//  View-ExpenseStyling.swift
//  iExpense
//
//  Created by Jonathan Copeland on 31/03/2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundColor(.gray)
        } else if item.amount < 100 {
            return self.foregroundColor(.black)
        } else {
            return self.foregroundColor(.red)
        }
    }
}


