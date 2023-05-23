//
//  Contact.swift
//  NameFinder
//
//  Created by Jonathan Copeland on 22/05/2023.
//

import Foundation

class Contact: ObservableObject {
    @Published var items = [ContactItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    let example = [ContactItem(name: "John Maeda", description: "The guy who spoke about AI"), ContactItem(name: "Andrea Harwell", description: "An accountant that works for Justin")]
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ContactItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
