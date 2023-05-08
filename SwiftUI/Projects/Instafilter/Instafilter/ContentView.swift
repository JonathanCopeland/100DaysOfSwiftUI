//
//  ContentView.swift
//  Instafilter
//
//  Created by Jonathan Copeland on 05/05/2023.


import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image : Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var placeholderEmpty = true
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(4)
                    
                    if(image == nil) {
                        Text("Tap to select a picture")
                            .foregroundColor(.blue)
                            .font(.headline)

                    }

                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                VStack {
                                            
                        if(currentFilter.inputKeys.contains(kCIInputIntensityKey)) {
                            HStack {
                                Text("Intensity")
                                Slider(value: $filterIntensity)
                                    .onChange(of: filterIntensity) { _ in
                                        applyProcessing()
                                        
                                    }
                            }
 
                        }
                    
                                             
                        if(currentFilter.inputKeys.contains(kCIInputRadiusKey)) {
                            HStack {
                                Text("Radius")
                                Slider(
                                    value: $filterRadius,
                                    in: 0...1
                                )
                                    .onChange(of: filterRadius) { _ in
                                        applyProcessing()
                                }
                            }
                        }
                    
                        if(currentFilter.inputKeys.contains(kCIInputScaleKey)) {
                            HStack {
                                Text("Scale")
                                Slider(value: $filterScale)
                                    .onChange(of: filterScale) { _ in
                                        applyProcessing()
                                }
                            }
                        }
      
                }
                .padding(.vertical)

                




                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                        
                    }

                    Spacer()

                    Button("Save") {
                        save()
                    }
                    .disabled(placeholderEmpty)
                    
                    
                    
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) {
                _ in loadImage()
                placeholderEmpty = false
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Group{
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                    Button("Edges") { setFilter(CIFilter.edges()) }
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                    Button("Vignette") { setFilter(CIFilter.vignette()) }
                    Button("Bloom") { setFilter(CIFilter.bloom()) }
                    Button("Comic") { setFilter(CIFilter.comicEffect()) }
                    Button("xRay") { setFilter(CIFilter.xRay()) }

                }
                
                Group {
                    Button("Noir") { setFilter(CIFilter.photoEffectNoir()) }
                    Button("Pointillize") { setFilter(CIFilter.pointillize()) }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()

        imageSaver.successHandler = {
            print("Success!")
        }

        imageSaver.errorHandler = {
            print("Oops: \($0.localizedDescription)")
        }

        imageSaver.writeToPhotoAlbum(image: processedImage)
        
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
