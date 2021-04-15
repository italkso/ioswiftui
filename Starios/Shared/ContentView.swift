//
//  ContentView.swift
//  Shared
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var darkMode = false

    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
