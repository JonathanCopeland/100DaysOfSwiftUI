//
//  ContentView.swift
//  Moonshot
//
//  Created by Jonathan Copeland on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            // more code to come
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
