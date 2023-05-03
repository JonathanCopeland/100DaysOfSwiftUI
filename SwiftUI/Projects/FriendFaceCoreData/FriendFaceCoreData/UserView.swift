//
//  UserView.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import SwiftUI

struct UserView: View {
        
    let user: CachedUser
    
    var body: some View {
        
        // This works with local JSON, I now need to do it call it remotely
        
        List {
            Section {
                Text(user.wrappedName)
                Text("\(user.age) years old")
                Text(user.wrappedCompany)
                Text(user.wrappedAbout)
            }
            
            Section("Friends") {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            }

        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

//struct UserView_Previews: PreviewProvider {
//
//    static let users = Bundle.main.decode([User].self, from: "FriendFaceData.json")
//
//    static var previews: some View {
//        UserView(user: users[0])
//    }
//}
