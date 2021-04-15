//
//  MarsView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct MarsView: View {
    let marsInfo = """
    While it was wetter and warmer with a thicker atmosphere billions of years ago, now Mars is a dusty, cold, desert world with a very thin atmosphere,.
    """
    
    var body: some View {
        Text("About Mars")
            .font(.system(size: 25, weight: .bold, design: .rounded))
            .padding()
            .foregroundColor(.primary)
            
        
        // Multiline Text
        Text(marsInfo)
            .font(.system(size: 25, weight: .light, design: .serif))
            .padding()
            .lineLimit(2)
            .lineSpacing(5)
            .allowsTightening(true)
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.leading)
            .truncationMode(.middle)
        
        
        //  Image Modifier
//        Image("Mars2003")
//            .resizable()
//            .imageScale(.small)
//            .scaledToFit()
//            .cornerRadius(10)
//            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 200, maxHeight: .infinity, alignment: .center)
//            .padding()
//            
//        Text("Image credit: NASA/JPL/Malin Space Science Systems")
//            .font(.footnote)
    }
}

struct MarsView_Previews: PreviewProvider {
    static var previews: some View {
        MarsView()
    }
}
