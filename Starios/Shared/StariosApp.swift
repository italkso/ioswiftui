//
//  StariosApp.swift
//  Shared
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

@main
struct StariosApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                TabView {
                    Home()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    Wiki()
                        .tabItem {
                            Label("Wiki", systemImage: "lifepreserver.fill")
                        }
                    MissionsList()
                        .tabItem {
                            Label("Mission", systemImage: "checkmark.seal.fill")
                        }
                    Location()
                        .tabItem {
                            Label("Location", systemImage: "mappin.and.ellipse")
                        }
                    Me()
                        .tabItem {
                            Label("Me", systemImage: "person.circle.fill")
                        }
                }
            }
        }
    }
}
