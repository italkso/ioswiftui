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
    @State private var showScanSheet = false
    @State private var amount2: CGFloat = 1

    let name = "Ernst Mach"
    let id = "0000000001"
    let bio = "Keep it simple and stupid"
    let rule = [GridItem(.adaptive(minimum: 220))]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("\(name)")
                                    .font(.system(size: 25, weight: .bold, design: .rounded))
                                    .foregroundColor(.red)
                                Button(action: {
                                    //
                                }) {
                                    Image(systemName: "gear")
                                }
                                
                            }

                            HStack {
                                Text("ID: \(id)")
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                                Image(systemName: "qrcode")
                                    .resizable()
                                    .frame(width: 10, height: 10, alignment: .center)
                                    .imageScale(.small)
                                    .scaledToFit()
                                    .foregroundColor(.primary)
                            }

                            HStack(alignment: .top, spacing: 10) {
                                Text("\(bio)")
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .imageScale(.small)
                                    .scaledToFit()
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.horizontal, 5)
                        .offset(x: 5, y: 20)
                        Spacer()
                        AvatarView().padding(.vertical).offset(x: 0, y: 10.0)
                    }
                    .padding()
                    .opacity(0.9)

                    VStack(alignment: .leading, spacing: 20) {
                        Text("Collections")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()

                        // MARK: - ScrollView

                        LazyVGrid(columns: rule, spacing: 20) {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    // Use custom modifier
                                    Text("One")
                                        .collectionsModifirer()
                                    Text("Two")
                                        .collectionsModifirer()
                                    Text("Three")
                                        .collectionsModifirer()
                                    Text("Four")
                                        .collectionsModifirer()
                                }
                            }
                        }

                        Text("Scroll these cards")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                Form {
                    Section {
                        HStack {
                            Image(systemName: "gear")
                            NavigationLink("Settings", destination: SettingView())
                        }
                    }
                }
            }
        }
    }
}

//  Create custom modifier - Step1
struct CollectionsModifirer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 90, height: 90, alignment: .center)
            .background(Color.orange)
            .opacity(0.9)
            .cornerRadius(20)
            .shadow(color: .orange, radius: 5, x: 5, y: 5)
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