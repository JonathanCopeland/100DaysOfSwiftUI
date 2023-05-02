//
//  Friend.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
    
    static let example1 = Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")
    static let example2 = Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton")
    static let example3 = Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson")
    
}

