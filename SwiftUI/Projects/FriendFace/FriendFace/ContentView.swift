//
//  ContentView.swift
//  FriendFace
//
//  Created by Jonathan Copeland on 01/05/2023.
//

import SwiftUI


struct ContentView: View {
    
        
    // let users = Bundle.main.decode([User].self, from: "FriendFaceData.json")
    // Above is the code for local JSON data
    
    @State private var users = [User]()
    
    
    var body: some View {

        NavigationView {
            List(users) { user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    VStack (alignment: .leading) {
                        Text(user.name)
                            .fontWeight(.medium)
                        Text(user.email)
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
                users = decodedResponse
            }
            
        } catch {
            print("Invalid data")
        }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


