//
//  ContentView.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/3/20.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case photoPicker, settings
    
    var id: Int {
        self.hashValue
    }
}

enum ActiveAlert: Identifiable {
    case incompatible, incorrectSize, success
    
    var id: Int {
        self.hashValue
    }
}

struct ContentView: View {
    
    @State private var image = ImageLoader().getImage(with: "original") ?? UIImage()
    @State var activeSheet: ActiveSheet?
    @State var activeAlert: ActiveAlert?
    @State var imageSet = false
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer(minLength: 20)
                if image.cgImage != nil || image.ciImage != nil {
                    
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onChange(of: image, perform: { value in
                            let imageSize = image.size
                            let imageSizeString = "\(Int(imageSize.width))x\(Int(imageSize.height))"
                            let deviceResolution = ImageCropper.shared.getScreenResolution()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.activeAlert = imageSizeString == deviceResolution ? .success : .incorrectSize
                            }
                        })
                    
                    
                }
                
                Button(action: {
                    Haptics.shared.playSelectionImpact()
                    self.activeSheet = .photoPicker
                }, label: {
                    HStack {
                        Image(systemName: "plus.app.fill")
                        Text("Select Screenshot")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    
                })
                Text("On the home screen, enter Jiggle Mode, keep swiping right till you reach a blank page and take a screenshot. Enter the app and select this screenshot. For best results, turn off perspective zoom on your wallpaper.")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .padding()
                
                Spacer(minLength: 20)
                
            }
            .navigationBarTitle(Text("Hidden Widgets"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                Haptics.shared.playSelectionImpact()
                self.activeSheet = .settings
            }, label: {
                Image(systemName: "gear")
                    .imageScale(.large)
            }))
        }
        .onAppear() {
            let resolution = ImageCropper.shared.getScreenResolution()
            if Measurements.WIDGET_SIZE[resolution] == nil {
                Haptics.shared.playError()
                self.activeAlert = .incompatible
            }
            if self.image.ciImage != nil && self.image.cgImage != nil {
                imageSet = true
            }
        }
        .alert(item: $activeAlert) { item in
            if item == .incompatible {
                return Alert(title: Text("Incompatible"), message: Text("This app is not compatible with your device on this display mode."), dismissButton: .default(Text("Ok"), action: {
                    fatalError()
                }))
            } else if item == .incorrectSize {
                return Alert(title: Text("Incorrect Screenshot"), message: Text("The image you provided does not match your device/display mode and may not function correctly. Please make sure you provide a valid screenshot."), dismissButton: .default(Text("Ok")))
            } else if item == .success {
                return Alert(title: Text("Success!"), message: Text("Your screenshot was successfully cropped, go to your home screen and add your widgets"), dismissButton: .default(Text("Ok")))
            } else {
                return Alert(title: Text("Invalid"), message: Text(""), dismissButton: .default(Text("Ok")))
            }
        }
        .sheet(item: $activeSheet) { item in
            if item == .photoPicker {
                ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
            } else {
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
