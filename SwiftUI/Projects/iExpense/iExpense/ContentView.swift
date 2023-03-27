//
//  ContentView.swift
//  iExpense
//
//  Created by Jonathan Copeland on 20/03/2023.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false



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
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    

    
    
    var personalExpenses: some View {
        ForEach(expenses.items.filter {
            $0.type == "Personal"
        }) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }

                Spacer()
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(item.amount > 100 ? .red: item.amount > 10 ? .black : .gray)
                
            }
        }
        .onDelete(perform: removeItems)
        
    }
    

    
    var businessExpenses: some View {
        ForEach(expenses.items.filter {
            $0.type == "Business"
        }) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.type)
                }

                Spacer()
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(item.amount > 100 ? .red: item.amount > 10 ? .black : .gray)
                
            }
        }
        .onDelete(perform: removeItems)
    }
    
    func removeItems(at offsets: IndexSet) {
        
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
