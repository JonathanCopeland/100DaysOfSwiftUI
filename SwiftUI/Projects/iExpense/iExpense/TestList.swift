//
//  TestList.swift
//  iExpense
//
//  Created by Jonathan Copeland on 27/03/2023.
//

import SwiftUI

struct TestList: View {
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Personal")) {
                    personalExpenses
                }
                Section(header: Text("Business")) {
                    businessExpenses
                }
            }
            .navigationTitle("iExpense")

            
        }
    }
    
    var personalExpenses: some View {
        
        
        
        ForEach(expenses.items.filter {
            $0.type == "Personal"
        }) { item in
            Text(item.name)
        }
        .onDelete(perform: removeItems)


        
        

        
    }
    
    var businessExpenses: some View {

        
        ForEach(expenses.items.filter {
            $0.type == "Business"
        }) { item in
            Text(item.name)
        }
        .onDelete(perform: removeItems)
        
    }
    
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    
}

struct TestList_Previews: PreviewProvider {
    static var previews: some View {
        TestList(expenses: Expenses())
    }
}
