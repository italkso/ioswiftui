//
//  SubView.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

struct SubView: View {
    @Binding var userInput: String
    
    var body: some View {
        TextField("Enter username",text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(userInput: .constant(""))
    }
}
