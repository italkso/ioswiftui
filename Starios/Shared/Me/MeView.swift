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

    let name = "Ernst Mach 🚀"
    let id = "11234435"
    let bio = "Keep it simple and stupid"
    let rule = [GridItem(.adaptive(minimum: 220))]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    ZStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(name)")
                                    .font(.headline)
                                HStack {
                                    Text("ID: \(id)")
                                        .font(.footnote)
                                    Image(systemName: "qrcode")
                                        .imageScale(.small)
                                        .foregroundColor(.primary)
                                }
                                Text("\(bio)")
                                    .font(.footnote)
                            }

                            Spacer()
                            AvatarView()
                        }
                    }
                }

                Section {
                    Text("Introduction").font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("Ernst Mach (February 18, 1838 – February 19, 1916) made major contributions to physics, philosophy, and physiological psychology. In physics, the speed of sound bears his name, as he was the first to systematically study super-sonic motion. He also made important contributions to understanding the Doppler effect. His critique of Newtonian ideas of absolute space and time were an inspiration to the young Einstein, who credited Mach as being the philosophical forerunner of relativity theory. His systematic skepticism of the old physics was similarly important to a generation of young German physicists.")
                        .lineLimit(4)
                        .lineSpacing(8.0)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.secondary)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 6, alignment: .topLeading)
                        .padding(.vertical)
                }

                Section {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Collections").font(.system(size: 20, weight: .bold, design: .rounded))

                        LazyVGrid(columns: rule, spacing: 20) {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    Text("1")
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .background(Color.red)
                                    Text("2")
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .background(Color.orange)
                                    Text("3")
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .background(Color.yellow)
                                    Text("4")
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .background(Color.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("About Me"), displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: {
                    self.showScanSheet = false
                }) {
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(.blue)
                    NavigationLink("", destination: LikeView())
                },
                trailing: Button(action: {
                    self.showEditSheet = true
                }) {
                    Image(systemName: "gear").foregroundColor(.secondary)
                })
            .sheet(isPresented: $showEditSheet) { SettingView() }
//            .navigationBarHidden(true)
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
