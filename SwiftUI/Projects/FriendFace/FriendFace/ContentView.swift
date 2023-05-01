//
//  ContentView.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import SwiftUI

struct ContentView: View {
        
    let users = Bundle.main.decode([User].self, from: "FriendFaceData.json")
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    VStack (alignment: .leading) {
                        Text(user.name)
                        Text(user.email)
                    }
                }
            }
            .navigationTitle("Friends")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


