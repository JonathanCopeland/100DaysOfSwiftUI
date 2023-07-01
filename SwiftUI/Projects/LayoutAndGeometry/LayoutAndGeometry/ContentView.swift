//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Jonathan Copeland on 27/06/2023.
//

import SwiftUI


struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(1, geo.frame(in: .global).minY / fullView.size.height), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 200)
                        

                    }
                    .frame(height: 40)
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
