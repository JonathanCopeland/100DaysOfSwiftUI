//
//  PreviousResultsView.swift
//  DiceChallenge
//
//  Created by Jonathan Copeland on 03/07/2023.
//

import SwiftUI

struct PreviousResultsView: View {
    
    @ObservedObject var results: PreviousResults

    
    var body: some View {
        NavigationView {
            List {
                ForEach(results.items.reversed()) { item in
                    Text("\(item.result)")
                }
            }
            .navigationTitle("Previous results")
            .toolbarTitleDisplayMode(.inline)
        }

    }
    
}

#Preview {
    PreviousResultsView(results: PreviousResults())
}
