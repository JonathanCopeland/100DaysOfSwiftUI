//
//  Heading.swift
//  ViewsAndModifiers
//
//  Created by Jonathan Copeland on 2020/12/28.
//

import SwiftUI

struct Heading: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
            Spacer()
        }.padding()
    }
}

extension View {
    func headingStyle() -> some View {
        self.modifier(Heading())
    }
}
