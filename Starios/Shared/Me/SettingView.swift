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
                    NavigationLink("Edit Profile", destination: ProfileView())
                    Text("General")
                    Text("Privacy")
                    Text("Feedback")
                    Text("About")
                    Text("Rate")
                }
                
                Section {
                    Button("Switch Account") {
                        // MARK: -TODO
                    }
                    Button("Exit") {
                        // MARK: -TODO
                    }
                }
            }
            .navigationBarTitle(Text("Setting"), displayMode:.inline)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
