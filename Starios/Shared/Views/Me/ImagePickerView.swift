//
//  ImagePickerView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct ImagePickerView: View {
    
        @State var imageData: Data = .init(capacity: 0)
        @State var showSheetForImagePicker = false
        @State var imagePicker = false
        @State var source: UIImagePickerController.SourceType = .camera
        
        var body: some View {
            NavigationView{
                ZStack{
                    
                    NavigationLink(destination: ImagePicker(showImagePicker: $imagePicker, image: $imageData, source: source), isActive: $imagePicker) {
                        Text("me")
                    }
                    VStack {
                        if imageData.count != 0 {
                                Image(uiImage: UIImage(data: self.imageData)!)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.orange, lineWidth: 3))
                                    .foregroundColor(.secondary)
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                    .stroke(Color.orange)
                                )
                                .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                        }
                        
                        Button(action: {
                            self.showSheetForImagePicker.toggle()
                        }){
                            Text("Edit")
                                .foregroundColor(.white)
                                .padding(.horizontal,30)
                                .padding(.vertical,10)
                                .background(Color.blue.opacity(1))
                                .clipShape(Capsule())
                        }
                    }
                    .navigationBarHidden(true)
                    .actionSheet(isPresented: $showSheetForImagePicker) {
                        ActionSheet(
                            title: Text("Select"),
                            message:  Text(""),
                            buttons: [
                                .default(Text("Photo Library"), action: {
                                    self.source = .photoLibrary
                                    self.imagePicker.toggle()
                            }),
                                .destructive(Text("Camera"), action: {
                                    self.source = .camera
                                    self.imagePicker.toggle()
                            }),
                                .cancel(Text("Cancel"))
                            ]
                        )
                    }
                }
            }
        }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
