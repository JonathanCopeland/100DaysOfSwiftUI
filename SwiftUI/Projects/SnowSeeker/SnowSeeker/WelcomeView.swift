//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Jonathan Copeland on 29/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}


#Preview {
    WelcomeView()
}