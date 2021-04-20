//
//  SuperView.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

struct SuperView: View {
    @State var userInput = "Hello"
    
    var body: some View {
        
        VStack {
            SubView(userInput:$userInput)
            TextField("Enter username",text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct SuperView_Previews: PreviewProvider {
    static var previews: some View {
        SuperView()
    }
}
