//
//  Me.swift
//  Starios
//
//  Created by aaron on 2021/4/13.
//

import SwiftUI

struct Me: View {
    @State private var degree: Double = 0
    @State private var showEditSheet = false
    @State private var showSheet = false
    @State private var amount2: CGFloat = 1

    // ImagePicker
    @State var imageData: Data = .init(capacity: 0)
    @State var showImagePicker = false
    @State var imagePicker = false
    @State var source: UIImagePickerController.SourceType = .camera

    let name = "Ernst Mach"
    let id = "0000000001"
    let bio = "Keep it simple and stupid"
    let rule = [GridItem(.flexible(minimum: 200))]

    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.black, .orange]), startPoint: .leading, endPoint: .trailing)
                            .edgesIgnoringSafeArea(.all)
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(name)")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.accentColor)

                                HStack {
                                    Text("ID: \(id)")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                    Image(systemName: "qrcode")
                                        .resizable()
                                        .frame(width: 10, height: 10, alignment: .center)
                                        .imageScale(.small)
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                }

                                HStack(alignment: .center, spacing: 10) {
                                    Text("\(bio)")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .frame(width: 15, height: 15, alignment: .center)
                                        .imageScale(.small)
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                }
                            }.padding()
                            Spacer()
                            VStack {
                                NavigationLink(destination: ImagePicker(showImagePicker: $imagePicker, image: $imageData, source: source), isActive: $imagePicker) {
                                    Text("")
                                }
                                VStack {
                                    ZStack {
                                        if imageData.count != 0 {
                                            Image(uiImage: UIImage(data: self.imageData)!)
                                                .resizable()
                                                .imageScale(.small)
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.orange)
                                                )
                                                .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                                        } else {
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .imageScale(.small)
                                                .padding()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white)
                                                )
                                                .shadow(color: .white, radius: 10, x: 0.0, y: 0.0)
                                        }

                                        Button(action: {
                                            self.showImagePicker.toggle()
                                        }) {
                                            Image(systemName: "camera")
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 15)
                                                .padding(.vertical, 10)
                                                .background(Color.accentColor.opacity(0.3))
                                                .clipShape(Circle())
                                                .offset(x: 40, y: 30)
                                        }.actionSheet(isPresented: $showImagePicker) {
                                            ActionSheet(
                                                title: Text("Select"),
                                                message: Text("Select a photo as your avatar"),
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
                            }.padding() // AvatarPicker
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Collections")
                            .padding(.horizontal)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)

                        // MARK: - ScrollView

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyVGrid(columns: rule) {
                                HStack(alignment:.center) {
                                    // Use custom modifier
                                    Text("Upload")
                                        .collectionsModifirer()
                                    Text("Upload")
                                        .collectionsModifirer()
                                    Text("Upload")
                                        .collectionsModifirer()
                                    Text("Upload")
                                        .collectionsModifirer()
                                }
                            }
                        }.padding(.vertical)

                        Text("Favorites")
                            .padding(.horizontal)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)
                        
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach(0 ... 5, id: \.self) {
                                    let codepoint = $0 + 0x1F600
                                    let codepointString = String(format: "%02X", codepoint)
                                    Text("\(codepointString)")
                                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                                    Text("\(emoji)")
                                }
                            }.font(.largeTitle)
                        }
                    }
                    Spacer(minLength: 10)
                }
            }
            .navigationBarTitle("Me", displayMode: .inline)
            .navigationBarItems(
                trailing:
                Button(action: {
                    // TODO: - Countdown
                    self.showSheet = true
                }) {
                    Image(systemName: "gear")
                        .imageScale(.large).foregroundColor(.accentColor)
                }
            )
            .sheet(isPresented: $showSheet) { SettingView() }
        }
    }
}

//  Create custom modifier - Step1
struct CollectionsModifirer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color.accentColor)
            .opacity(0.9)
            .cornerRadius(20)
            .shadow(color: .white, radius: 2, x: 2, y: 2)
            .padding()
    }
}

// Create custom modifier - Step2
extension View {
    func collectionsModifirer() -> some View {
        modifier(CollectionsModifirer())
    }
}

struct Me_Previews: PreviewProvider {
    static var previews: some View {
        Me()
    }
}
