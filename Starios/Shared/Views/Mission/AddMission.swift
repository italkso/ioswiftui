//
//  AddMission.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

struct AddMission: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject var missionData = MissionData()
    @State var titleInput = ""
    @State var contentInput = "Write something..."
    @Binding var isMarked: Bool
    
    // MARK: - ImagePicker (Variables) - 1
    @State var image: Data = .init(capacity: 0)
    @State var showImagePicker = false
    @State var imagePicker = false
    @State var source: UIImagePickerController.SourceType = .camera

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 10) {
                    TextField("Title", text: $titleInput)
                        .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: .secondary, radius: 5.0, x: 0.0, y: 0.0)
                }

                TextEditor(text: $contentInput)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .shadow(color: .secondary, radius: 5.0, x: 0.0, y: 0.0)
                    
                
                // MARK: - ImagePicker (Display) - 3
                if image.count != 0 {
                    Image(uiImage: UIImage(data: self.image)!)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: .secondary, radius: 5.0, x: 0.0, y: 0.0)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: .secondary, radius: 5.0, x: 3.0, y: 3.0)
                }
                
                // MARK: - ImagePicker (Link + Button + Sheet) - 2
                
                HStack(alignment: .center, spacing: 10) {
                    Button(action: {
                        self.showImagePicker.toggle()
                    }) {
                        RoundedButton(text: "Image", image: "camera.fill")
                    }.actionSheet(isPresented: $showImagePicker) {
                        ActionSheet(
                            title: Text("Select"),
                            message: Text("Select a photo"),
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
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        RoundedButton(text: "Cancle", image: "xmark.seal.fill")
                    } // Cancle Button

                    Button(action: {
                        save()
                    }) {
                        RoundedButton(text: "Save", image: "checkmark.seal.fill")
                    } // Save Button
                    
                    NavigationLink(destination: ImagePicker(showImagePicker: $imagePicker , image: $image, source: source), isActive: $imagePicker ) {
                        Text("")
                    }
                }

                Spacer()
            }
            .navigationBarTitle(Text("Add a mission"), displayMode: .inline)
        }
    }
    
    func save() {
        let id = UUID()
        // MARK: - ImagePicker (Save) - Result
        if let data = UIImage(data: image)?.pngData() {
            missionData.saveImages(id: id, data: data)
        }
        let newMission = MarsMission(id: id, title: titleInput, content: contentInput, imageURLAppendix: image.count == 0  ? nil : "\(id).png")
        if (titleInput != "" || contentInput != "" || image.count != 0) {
            missionData.missions.append(newMission)
            missionData.saveMissions()
            titleInput = ""
            contentInput = ""
            image.count = 0
            
            self.presentationMode.wrappedValue.dismiss()
            }
        }
    }


struct AddMission_Previews: PreviewProvider {
    static var previews: some View {
        AddMission(isMarked: .constant(true))
    }
}
