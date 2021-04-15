//
//  SignInView.swift
//  Starios
//
//  Created by aaron on 2021/4/13.
//

import SwiftUI

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack{
            // Use Linear Gradient as background
            LinearGradient(gradient: Gradient(colors: [.black,.orange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all).opacity(0.1)
            
            // Container
            VStack(alignment:.center, spacing: 10) {
                
                Text("Welcome to Mars")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .padding()
                
                Spacer()
                
                Label("Sign up to know more about Mars", systemImage: "")
                    .font(.body)
                
                TextField("Username", text: $username) .inputFieldStyle()
                    
                SecureField("Password", text: $password)
                    .inputFieldStyle()
                
                HStack{
                    Button("") {
                        //
                    }
                    .padding(.horizontal)
                    .overlay(
                        Image(systemName: "circle")
                            .imageScale(.small)
                            .foregroundColor(.blue)
                    )
                    
                    Text("Agree to")
                        .font(.footnote)
                    Link("User Agreement",destination:URL(string:"https://www.example.com")!).font(.footnote)
                    
                }
                
                Button("Sign Up") {
                    print("")
                }
                .font(.headline)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Rectangle())
                .cornerRadius(10)
                .shadow(color: .secondary, radius: 5, x: 1, y: 5)
                
                Spacer()
                
            }
        }
    }
}

//  Create custom modifier - Step1
struct InputFieldModifirer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.primary)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width / 1.1)
            .padding()
            .shadow(color: .secondary, radius: 5, x: 1, y: 5)
    }
}

// Create custom modifier - Step2
extension View {
    func inputFieldStyle() -> some View {
        self.modifier(InputFieldModifirer())
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
