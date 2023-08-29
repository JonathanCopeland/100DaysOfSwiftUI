//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Jonathan Copeland on 29/08/2023.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    ResortDetailsView(resort: resort)
                    SkiDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilitate")
                        .font(.headline)
                    
                    Text(resort.facilities, format: .list(type: .and))
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ResortView(resort: Resort.example)
}