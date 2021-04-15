//
//  AvatarView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct AvatarView: View {
    
    var body: some View {
        Image("aircraft")
            .resizable()
            .imageScale(.small)
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .overlay(
                Circle()
                .stroke(Color.orange)      
            )
            .shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
