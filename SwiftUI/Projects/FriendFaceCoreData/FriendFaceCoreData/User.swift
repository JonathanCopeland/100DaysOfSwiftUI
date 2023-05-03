//
//  User.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let isActive: Bool
    let company: String
    let email: String
    let address: String
    let about: String
    
    // Change this to type date later
    let registered: String
    
    let friends: [Friend]
    let tags: [String]
    
    static let example = User(id: UUID(), name: "Alford Rodriguez", age: 21, isActive: false, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "2015-11-10T01:47:18-00:00", friends: [Friend.example1, Friend.example2, Friend.example3], tags: ["cillum","consequat","deserunt"])
    

}

