//
//  LoadView.swift
//  GuessTheFlag
//
//  Created by Jonathan Copeland on 2020/12/27.
//

import SwiftUI

struct LoadView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView().environmentObject(ViewRouter())
    }
}
