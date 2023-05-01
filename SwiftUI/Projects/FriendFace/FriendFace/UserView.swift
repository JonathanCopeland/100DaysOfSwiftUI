//
//  UserView.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import SwiftUI

struct UserView: View {
        
    let user: User
    
    var body: some View {
        
        List {
            Section {
                Text(user.name)
                Text("\(user.age) years old")
                Text(user.company)
                Text(user.about)
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }

        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct UserView_Previews: PreviewProvider {

    static let users = Bundle.main.decode([User].self, from: "FriendFaceData.json")

    static var previews: some View {
        UserView(user: users[0])
    }
}
