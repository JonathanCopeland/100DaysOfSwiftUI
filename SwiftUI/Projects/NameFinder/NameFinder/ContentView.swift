//
//  ContentView.swift
//  NameFinder
//
//  Created by Jonathan Copeland on 22/05/2023.
//

/*
 Your goal is to build an app that asks users to
 import a picture from their photo library, then
 attach a name to whatever they imported.
 
 The full collection of pictures they name should
 be shown in a List, and
 tapping an item in the list should show a detail screen with a larger version of the picture.
 */

import SwiftUI

struct ContentView: View {
    
    @StateObject var contacts = Contact()
    
    @State private var showingAddContact = false

    
    @State private var image : Image?
    @State private var showAlert = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts.example) { contact in
                    
                    NavigationLink {
                        ContactView(contacts: contacts, contact: contact)
                    } label: {
                        Text(contact.name)
                    }
                    
                    
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                Button {
                    showingAddContact = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddContact) {
                AddView(contacts: contacts)
            }

        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
