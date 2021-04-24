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

    let name = "Ernst Mach"
    let id = "0000000001"
    let bio = "Keep it simple and stupid"
    let rule = [GridItem(.adaptive(minimum: 200))]

    var body: some View {
        NavigationView {
                ScrollView {
                    VStack(alignment: .center) {
                        AvatarView()
                            .padding()
                            .offset(x: 0, y: 10.0)

                        Text("\(name)")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)

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
                    }.padding()
                    

                    VStack(alignment: .center) {
                        Text("Collections")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.accentColor)
                            .padding()
                        
                        Divider()

                        // MARK: - ScrollView

                        LazyHGrid(rows: rule, spacing: 10) {
                            ScrollView(.horizontal, showsIndicators: false) {
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
                        }.padding()

                        Text("Scroll these cards")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .navigationBarItems(
                    trailing:
                    Button(action: {
                       // TODO: - Countdown
                        self.showSheet = true
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large).foregroundColor(.accentColor)
                    }
                ).sheet(isPresented: $showSheet) { SettingView() }
        }
    }
}

//  Create custom modifier - Step1
struct CollectionsModifirer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 90, height: 90, alignment: .center)
            .background(Color.accentColor)
            .opacity(0.9)
            .cornerRadius(20)
            .shadow(color: .white, radius: 5, x: 5, y: 5)
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
