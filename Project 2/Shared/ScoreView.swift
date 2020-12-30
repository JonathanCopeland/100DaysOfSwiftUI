//
//  ScoreView.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 2020/12/27.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(ViewRouter())
    }
}
