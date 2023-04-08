//
//  ContentView.swift
//  Moonshot
//
//  Created by Jonathan Copeland on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true

    var body: some View {
        NavigationView {
            Group {
                if(showingGrid) {
                    MissionsGrid(astronauts: astronauts, missions: missions)
                }
                else {
                    MissionsList(astronauts: astronauts, missions: missions)
                }
            }
            
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


