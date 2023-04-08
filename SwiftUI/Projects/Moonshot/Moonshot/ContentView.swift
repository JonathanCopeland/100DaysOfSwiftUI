//
//  ContentView.swift
//  Moonshot
//
//  Created by Jonathan Copeland on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid = true

    var body: some View {
        
        NavigationStack {
            VStack {
                if(showingGrid) {
                    MissionsGrid()
                        .transition(.move(edge: .leading))
                }
                else {
                    MissionsList()
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Picker("", selection: $showingGrid){
                    Image(systemName: "square.grid.2x2").tag(true)
                    Image(systemName: "rectangle.grid.1x2").tag(false)

                }
                .pickerStyle(.segmented)
                .onTapGesture {
                    withAnimation {
                        showingGrid.toggle()
                    }
                }

            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


