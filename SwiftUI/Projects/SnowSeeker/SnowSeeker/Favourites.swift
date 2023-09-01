//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Jonathan Copeland on 01/09/2023.
//

import Foundation

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    @Published var resorts: Set<String> {
        didSet {
            if let encoded = try? JSONEncoder().encode(resorts) {
                UserDefaults.standard.set(encoded, forKey: "Favorites")
            }
        }
    }

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load our saved data
        if let savedResorts = UserDefaults.standard.data(forKey: "Favorites") {
            if let decodedResorts = try? JSONDecoder().decode(Set<String>.self, from: savedResorts) {
                resorts = decodedResorts
                return
            }
        }

        // still here? Use an empty array
        resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }

}


