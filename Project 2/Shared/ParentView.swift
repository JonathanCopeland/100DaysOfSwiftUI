//
//  ParentView.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 2020/12/27.
//

import SwiftUI

struct ParentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .LoadView:
            LoadView()
        case .ScoreView:
            ScoreView()
        case .GameView:
            GameView()
        }
    }
    
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView().environmentObject(ViewRouter())
    }
}
