//
//  Friend.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
    
    static let example1 = Friend(id: UUID(), name: "Hawkins Patel")
    static let example2 = Friend(id: UUID(), name: "Jewel Sexton")
    static let example3 = Friend(id: UUID(), name: "Berger Robertson")
    
}

