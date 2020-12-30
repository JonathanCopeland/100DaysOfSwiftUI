//
//  Colour.swift
//  iOS
//
//  Created by Jonathan Copeland on 2020/12/28.
//

import SwiftUI

struct Colour: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
    }
}

extension View {
    func alert() -> some View {
        self.modifier(Colour())
    }
}
