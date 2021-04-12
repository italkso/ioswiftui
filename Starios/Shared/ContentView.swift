//
//  ContentView.swift
//  Shared
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            FindView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass.circle")
                        Text("Find")
                    }
                }
                .tag(0)

            WikiView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "lifepreserver")
                        Text("Wiki")
                    }
                }
                .tag(1)

            LocationView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Location")
                    }
                }
                .tag(2)

            TaskView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark.seal")
                        Text("Task")
                    }
                }
                .tag(3)

            SettingView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Me")
                    }
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
