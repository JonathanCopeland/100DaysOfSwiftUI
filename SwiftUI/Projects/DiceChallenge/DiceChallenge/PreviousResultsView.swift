//
//  PreviousResultsView.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import SwiftUI

struct PreviousResultsView: View {
    
    @ObservedObject var history: History

    
    var body: some View {
        NavigationView {
            List {
                Text("value")
//                ForEach(results.items.reversed()) { item in
//                    Text("\(item.result)")
//                }
            }
            .navigationTitle("Previous results")
            .toolbarTitleDisplayMode(.inline)
        }

    }
    
}

#Preview {
    PreviousResultsView(history: History())
}
