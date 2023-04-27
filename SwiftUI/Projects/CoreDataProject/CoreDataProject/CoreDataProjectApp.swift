//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Jonathan Copeland on 27/04/2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
