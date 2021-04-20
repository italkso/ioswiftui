//
//  ContentView.swift
//  Shared
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct Home: View {
    @State private var selection = 0
    @AppStorage("darkMode") var darkMode = false

    var body: some View {
        NavigationView {
                TabView(selection: $selection) {
                    WikiView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "lifepreserver.fill")
                                Text("Wiki")
                            }
                        }
                        .tag(0)
                        

                    TaskView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "checkmark.seal.fill")
                                Text("Task")
                            }
                        }
                        .tag(1)
                    
                    LocationView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .animation(.default)
                                Text("Location")
                            }
                        }
                        .tag(2)

                    MeView()
                        .font(.title)
                        .tabItem {
                            VStack {
                                Image(systemName: "person.circle.fill")
                                Text("Me")
                            }
                        }
                        .tag(3)
                }
                .toolbar {
                    DarkModeSwitch(darkMode: $darkMode)
                }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
