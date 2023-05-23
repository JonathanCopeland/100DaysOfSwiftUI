//
//  ContactView.swift
//  NameFinder
//
//  Created by Jonathan Copeland on 23/05/2023.
//

import SwiftUI

struct ContactView: View {

    @ObservedObject var contacts: Contact
    var contact: ContactItem

    
    @Environment(\.dismiss) var dismiss

    @State private var name = contact.name
    @State private var description = contact.description
    
    var body: some View {
        Text("Hello")
    }
    
    init(contacts: Contact, contact: ContactItem) {
        self.contact = contact
    }
    
    
       
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contacts: Contact(), contact: ContactItem(name: "Peter", description: "A friend"))
    }
}


//
//class MyOwn {
//    let myUser: User
//    var life: Int
//
//    init() {
//        self.myUser = User(name: "John", age: 100)
//        self.life = myUser.age
//    }
//}
