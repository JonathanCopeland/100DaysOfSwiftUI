//
//  TestList.swift
//  iExpense
//
//  Created by Jonathan Copeland on 27/03/2023.
//

import SwiftUI

struct TestList: View {
    
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void

    
    var body: some View {
        
        NavigationView {
            List {
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)

            }
            .navigationTitle("iExpense")

            
        }
    }
    
//    var personalExpenses: some View {
//
//
//
//        ForEach(expenses.items.filter {
//            $0.type == "Personal"
//        }) { item in
//            Text(item.name)
//        }
//        .onDelete(perform: removeItems)
//
//
//
//
//
//
//    }
    
    var businessExpenses: some View {

        
        ForEach(expenses) { item in
            Text(item.name)
        }
//        .onDelete(perform: removeItems)
        
    }
    
    
//    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
//
    


    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()

        for offset in offsets {
            let item = inputArray[offset]

            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }

        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    
}

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
    }
}
