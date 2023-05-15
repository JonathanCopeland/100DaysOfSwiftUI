//
//  ContentView.swift
//  BucketList
//
//  Created by Jonathan Copeland on 08/05/2023.
//

import LocalAuthentication
import SwiftUI
import MapKit


struct ContentView: View {
    @StateObject private var viewModel = ViewModel()


    var body: some View {
        ZStack {
            if viewModel.isUnlocked {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            
                            Text(location.name)
                                .fixedSize()
                            
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                    
                }
                // MARK: Building Sheet UI
                // Since We Always Need Bottom Sheet At Bottom Setting to True By Default
                    .bottomSheet(presentationDetents: [.medium,.large,.height(70)], isPresented: .constant(true), sheetCornerRadius: 20,isTransparentBG: true) {
                        ScrollView(.vertical, showsIndicators: false) {
 
                            VStack {
                                Spacer()
                                HStack {
                                    Text("Locations")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .padding()
                                    Spacer()
                                    Button {
                                        viewModel.addLocation()
                                    } label: {
                                        Image(systemName: "plus")
                                            .padding()
//                                            .background(.black.opacity(0.75))
                                            .foregroundColor(.blue)
                                            .font(.title)
                                            .clipShape(Circle())
                                            .padding(.trailing)
                                    }

                                }
                            }
                            
                            
                            VStack{
                                ForEach(viewModel.locations) { location in
                                    HStack {
                                        VStack (alignment: .leading) {
                                            Text(location.name)
                                                .font(.headline)
                                            Text(location.description)
                                                .italic()
                                        }
                                        Spacer()
                                        Text(location.name)
                                    }
                                    .padding(.bottom)


                                }
                            }
                            .padding()
                            .padding(.top)
                            
                            
                        }
                        .background(content: {
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .ignoresSafeArea()
                        })
                        .sheet(item: $viewModel.selectedPlace) { place in
                            EditView(location: place) { newLocation in
                                viewModel.update(location: newLocation)
                            }
                            
                        }

                    } onDismiss: {}
                .ignoresSafeArea()
                
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)

                
                
            }else {
                Button("Unlock Places") {
                    viewModel.authenticate()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .alert("Authentication error", isPresented: $viewModel.isShowingAuthenticationError) {
                    Button("OK") { }
                } message: {
                    Text(viewModel.authenticationError)
                }
                }
            }

        
        
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

