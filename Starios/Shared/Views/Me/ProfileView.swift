//
//  ProfileView.swift
//  Starios
//
//  Created by aaron on 2021/4/13.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var peofileData = ProfileData()
    
    @State var nameInput = ""
    @State var bioInput = ""
    
    @State var introduction = ""
    
    var body: some View {
            VStack {
                ImagePickerView()
                TextField("name",text: $nameInput).padding()
                TextField("bio",text: $bioInput).padding()
                TextField("Introduction",text: $introduction)
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
