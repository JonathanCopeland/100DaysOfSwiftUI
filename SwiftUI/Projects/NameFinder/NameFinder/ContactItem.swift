//
//  ContactItem.swift
//  NameFinder
//
//  Created by Jonathan Copeland on 22/05/2023.
//

import Foundation

struct ContactItem : Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
}
