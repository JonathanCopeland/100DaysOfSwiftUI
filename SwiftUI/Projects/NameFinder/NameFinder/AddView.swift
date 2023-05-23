//
//  AddView.swift
//  NameFinder
//
//  Created by Jonathan Copeland on 23/05/2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var contacts: Contact
    
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new contact")
            .toolbar {
                Button("Save") {
                    let item = ContactItem(name: name, description: description)
                    contacts.items.append(item)
                    dismiss()
                }
            }
        }
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(contacts: Contact())
    }
}
