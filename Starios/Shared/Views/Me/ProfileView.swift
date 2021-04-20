//
//  ProfileView.swift
//  Starios
//
//  Created by aaron on 2021/4/13.
//

import SwiftUI

struct ProfileView: View {
    
    @State var introduction = "Write something about yourself..."
    
    var body: some View {
            VStack {
                ImagePickerView()
                TextEditor(text: $introduction)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding()
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                
                Spacer(minLength: 10)
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
