//
//  AvatarView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct AvatarView: View {
    @State private var degree: Double = 0
    
    var body: some View {
        Image("astronaut")
            .resizable()
            .scaledToFill()
            .imageScale(.small)
            .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 7)
            .offset(x: -55, y: 20)
            .rotationEffect(Angle(degrees: degree))
//            .animation(
//                Animation.easeInOut(duration: 5)
//                    .repeatForever(autoreverses: true)
//            )
//            .onAppear { self.degree = 360 }
            .clipShape(Circle())
            .shadow(color: .primary, radius: 5, x: 0, y: 0)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
