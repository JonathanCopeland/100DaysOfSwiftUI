//
//  FlagDesign.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 2020/12/30.
//

import SwiftUI

struct FlagDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .overlay(Capsule()
            .stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

extension View {
    func FlagDesignStyle() -> some View {
        self.modifier(FlagDesign())
    }
}
