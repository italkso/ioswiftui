//
//  MarsView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct MarsView: View {
    let marsInfo = """
    While it was wetter and warmer with a thicker atmosphere billions of years ago, now Mars is a dusty, cold, desert world with a very thin atmosphere.
    """
    
    var body: some View {
        Text("About Mars")
            .font(.system(size: 25, weight: .bold, design: .rounded))
            .padding()
            .foregroundColor(.orange)
            
        
        // Multiline Text
        Text(marsInfo)
            .font(.system(size: 15, weight: .light, design: .serif))
            .padding()
            .lineLimit(5)
            .lineSpacing(5)
            .allowsTightening(true)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.leading)
            .truncationMode(.middle)
        
        
        //  Image Modifier
        Image("IngenuityHelicopter")
            .resizable()
            .imageScale(.small)
            .scaledToFit()
            .cornerRadius(10)
            .padding()
        Text("Ingenuity Helicopter, credit: NASA/JPL-Caltech")
            .font(.footnote)
    }
}

struct MarsView_Previews: PreviewProvider {
    static var previews: some View {
        MarsView()
    }
}
