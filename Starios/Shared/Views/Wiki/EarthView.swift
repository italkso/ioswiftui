//
//  EarthView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct EarthView: View {
    let earthInfo = """
    Earth, our home planet, is the only place we know of so far that’s inhabited by living things. It's also the only planet in our solar system with liquid water on the surface.
    """

    var body: some View {
        VStack {
            Text("About Earth")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding()
                .foregroundColor(.accentColor)

            // Multiline Text
            Text(earthInfo)
                .font(.system(size: 15, weight: .light, design: .serif))
                .padding()
                .lineLimit(5)
                .lineSpacing(5)
                .allowsTightening(true)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .truncationMode(.middle)

            //  Image Modifier
            Image("reindeer")
                .resizable()
                .imageScale(.small)
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            Text("Reindeer, Credits: Logan Berner/Northern Arizona University")
                .font(.footnote)
        }
    }
}

struct EarthView_Previews: PreviewProvider {
    static var previews: some View {
        EarthView()
    }
}
