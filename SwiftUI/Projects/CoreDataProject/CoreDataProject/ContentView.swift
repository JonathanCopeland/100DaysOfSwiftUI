//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jonathan Copeland on 27/04/2023.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @State private var filterType = FilterType.contains
    @State private var sortDescriptors = [SortDescriptor<Singer>]()



    var body: some View {
        VStack {
            FilteredList(type: .beginsWith, filterKey: "lastname", filterValue: lastNameFilter, sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstname = "Taylor"
                taylor.lastname = "Swift"

                let ed = Singer(context: moc)
                ed.firstname = "Ed"
                ed.lastname = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstname = "Adele"
                adele.lastname = "Adkins"

                try? moc.save()
            }

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Begins with") {
                filterType = .beginsWith
            }

            Button("Contains") {
                filterType = .contains
            }
            
            Button("Sort A-Z") {
                sortDescriptors = [SortDescriptor(\.firstname)]
            }

            Button("Sort Z-A") {
                sortDescriptors = [SortDescriptor(\.firstname, order: .reverse)]
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


