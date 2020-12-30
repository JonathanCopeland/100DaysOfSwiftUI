//
//  CapsuleText.swift
//  ViewsAndModifiers
//
//  Created by Jonathan Copeland on 2020/12/28.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}


