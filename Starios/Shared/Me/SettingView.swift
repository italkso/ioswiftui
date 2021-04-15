//
//  SettingView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            Form() {
                Section {
                    NavigationLink("Sign in / Sign up", destination: SignInView())
                }

                Section {
                    NavigationLink("Profile", destination: ProfileView())
                    NavigationLink("General", destination: EmptyView())
                    NavigationLink("Privacy", destination: EmptyView())
                    NavigationLink("Feedback", destination: EmptyView())
                    NavigationLink("About", destination: EmptyView())
                    NavigationLink("Rate", destination: EmptyView())
                }
                
                Section {
                    
                    Button(action: {
                        // MARK: -TODO
                        print("Switch Account")

                    }, label: {
                        Text("Switch Account")
                    })
                    Button(action: {
                        // MARK: -TODO
                        print("Exit")

                    }, label: {
                        Text("Exit")
                    })
                }
            }
            .navigationBarTitle(Text("Settings"), displayMode:.inline)
            .font(.headline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
