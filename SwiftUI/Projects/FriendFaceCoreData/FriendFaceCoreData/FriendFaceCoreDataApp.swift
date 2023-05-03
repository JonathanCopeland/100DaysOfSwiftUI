//
//  FriendFaceCoreDataApp.swift
//  FriendFaceCoreData
//
//  Created by Jonathan Copeland on 02/05/2023.
//

import SwiftUI

@main
struct FriendFaceCoreDataApp: App {
    @StateObject var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}



