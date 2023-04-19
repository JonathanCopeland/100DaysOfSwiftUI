//
//  LoadingImages.swift
//  CupcakeCorner
//
//  Created by Jonathan Copeland on 19/04/2023.
//

import SwiftUI

struct LoadingImages: View {
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
        
    }
}

struct LoadingImages_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImages()
    }
}
