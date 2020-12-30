//
//  GuessTheFlagApp.swift
//  Shared
//
//  Created by Jonathan Copeland on 2020/12/03.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    
    @StateObject var viewRouter = ViewRouter()

    
    var body: some Scene {
        WindowGroup {
            ParentView().environmentObject(viewRouter)
        }
    }
}
