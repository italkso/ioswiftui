//
//  RoundedButton.swift
//  Starios
//
//  Created by aaron on 2021/4/19.
//

import SwiftUI

struct RoundedButton: View {
    
    let text: String
    let image: String
    
    var body: some View {
        HStack {
            Text(text)
            Image(systemName: image)
        }
        .font(.headline)
        .padding(10)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .opacity(0.9)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Destination", image: "circle")
    }
}
