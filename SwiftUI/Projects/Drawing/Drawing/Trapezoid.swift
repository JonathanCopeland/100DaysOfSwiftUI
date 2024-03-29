//
//  Trapezoid.swift
//  Drawing
//
//  Created by Jonathan Copeland on 10/04/2023.
//

import SwiftUI

struct TrapezoidTest: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct Trapezoid: View {
    
    @State private var insetAmount = 50.0

    
    var body: some View {
        TrapezoidTest(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        insetAmount = Double.random(in: 10...90)

                    }
                }
    }
}

struct Trapezoid_Previews: PreviewProvider {
    static var previews: some View {
        Trapezoid()
    }
}
