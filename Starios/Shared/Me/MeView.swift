//
//  MeView.swift
//  Starios
//
//  Created by aaron on 2021/4/13.
//

import SwiftUI

struct MeView: View {
    @State private var degree: Double = 0
    @State private var showEditSheet = false
    @State private var showScanSheet = false
    @State private var amount2: CGFloat = 1

    let name = "Ernst Mach 🚀"
    let id = "0000000001"
    let bio = "Keep it simple and stupid"
    let intro = """
        Ernst Mach (February 18, 1838 – February 19, 1916) made major contributions to physics, philosophy, and physiological psychology. In physics, the speed of sound bears his name, as he was the first to systematically study super-sonic motion. He also made important contributions to understanding the Doppler effect. His critique of Newtonian ideas of absolute space and time were an inspiration to the young Einstein, who credited Mach as being the philosophical forerunner of relativity theory. His systematic skepticism of the old physics was similarly important to a generation of young German physicists.
        """
    let rule = [GridItem(.adaptive(minimum: 220))]

    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(name)")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(.red)

                            HStack {
                                Text("ID: \(id)")
                                    .font(.footnote)
                                Image(systemName: "qrcode")
                                    .resizable()
                                    .frame(width: 10, height: 10, alignment: .center)
                                    .imageScale(.small)
                                    .scaledToFit()
                            }
                            
                            HStack(alignment: .top, spacing: 10) {
                                Text("\(bio)")
                                    .font(.footnote)
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .imageScale(.small)
                                    .scaledToFit()
                            }
                        }
                        .padding(.horizontal, 5)
                        .offset(x: 5, y: 20)
                        Spacer()
                        AvatarView().padding(.vertical).offset(x: 0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.primary)
                    .opacity(0.9)
                    
                   Spacer()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Introduction")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding()
                        Text(intro)
                            .font(.footnote)
                            .padding()
                            .lineLimit(5)
                            .lineSpacing(8.0)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.secondary)
                    }
                    
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
                    Form {
                        Section {
                            HStack {
                                Image(systemName: "gear")
                                NavigationLink("Settings", destination: SettingView())
                            }.font(.headline).padding(.horizontal)
                        }
                    }.padding(.horizontal, -40).offset(x: 0, y: 50)
                    Spacer()
                }
                .navigationBarTitle(Text("Me"), displayMode: .inline)
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

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
