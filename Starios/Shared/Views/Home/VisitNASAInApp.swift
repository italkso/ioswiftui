//
//  VisitNASAInApp.swift
//  Starios
//
//  Created by aaron on 2021/4/19.
//

import SwiftUI
import BetterSafariView // Visit a website in App

struct VisitNASAInApp: View {
    
    @State private var presentingSafariView = false
    
    var body: some View {
        Button(action: {
            self.presentingSafariView = true
        }) {
            RoundedButton(text: "Visit NASA", image: "arrow.up.forward.app")
        }
        .safariView(isPresented: $presentingSafariView) { SafariView(
        
            url: URL(string: "https://www.nasa.gov")!, configuration: SafariView.Configuration(
            entersReaderIfAvailable: true, barCollapsingEnabled: true
            )
        )
        .preferredBarAccentColor(.clear)
        .preferredControlAccentColor(.orange)
        .dismissButtonStyle(.close)
        }
    }
}

struct VisitNASAInApp_Previews: PreviewProvider {
    static var previews: some View {
        VisitNASAInApp()
    }
}
