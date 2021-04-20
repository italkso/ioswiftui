//
//  TestView.swift
//  Starios
//
//  Created by aaron on 2021/4/16.
//

import SwiftUI

struct MySuperView: View {
    
    @State var userInput = ""
    
    var body: some View {
        VStack {
            MySubView(userInput: $userInput)
            AnotherSubView(userInput: $userInput)
        }
    }
}

struct MySubView: View {
    @Binding var userInput: String
    
    var body: some View {
        TextField("Enter your name",text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .background(Color.red)
            
    }
}

struct AnotherSubView: View {
    @Binding var userInput: String
    
    var body: some View {
        TextField("Enter your name",text: $userInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .background(Color.blue)
    }
}

struct MySuperView_Previews: PreviewProvider {
    static var previews: some View {
        MySuperView()
    }
}

struct MySubView_Previews: PreviewProvider {
    static var previews: some View {
        MySubView(userInput: .constant(""))
    }
}
