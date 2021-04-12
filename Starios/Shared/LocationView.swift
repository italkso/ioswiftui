//
//  LocationView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        Text("Welcome to Mars")
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
            .opacity(0.9)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
