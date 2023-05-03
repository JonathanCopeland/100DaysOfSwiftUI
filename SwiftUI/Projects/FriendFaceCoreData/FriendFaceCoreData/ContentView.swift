//
//  ContentView.swift
//  FriendFaceCoreData
//
//  Created by Jonathan Copeland on 02/05/2023.
//

import SwiftUI

struct ContentView: View {
    
        
    // let users = Bundle.main.decode([User].self, from: "FriendFaceData.json")
    // Above is the code for local JSON data
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<CachedUser>

    var body: some View {

        NavigationView {
            List(users) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    VStack (alignment: .leading) {
                        Text(user.wrappedName)
                        Text(user.wrappedEmail)
                    }
                }
            }
            .navigationTitle("Friends")
            .task {
                if(users.isEmpty) {
                    await loadData()
                }
            }
        }

    }
    
    func loadData() async {

        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                
                
                
                let users = decodedResponse
                await MainActor.run {
                    updateCache(with: users)
                }
            }
            
        } catch {
            print("Invalid data")
        }
        
    }
    
    func updateCache(with downloadedUsers: [User]) {
        for user in downloadedUsers {
            let cachedUser = CachedUser(context: moc)

            cachedUser.id = user.id
            cachedUser.isActive = user.isActive
            cachedUser.name = user.name
            cachedUser.age = Int16(user.age)
            cachedUser.company = user.company
            cachedUser.email = user.email
            cachedUser.address = user.address
            cachedUser.about = user.about
            cachedUser.registered = user.registered
            cachedUser.tags = user.tags.joined(separator: ",")

            for friend in user.friends {
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.id = friend.id
                cachedFriend.name = friend.name
                cachedUser.addToFriends(cachedFriend)
            }
        }

        try? moc.save()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


