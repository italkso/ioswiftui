//
//  WikiView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct WikiView: View {
    
    var body: some View {
        NavigationView {
        VStack{
            FindView().padding()
            // Text
            
            List {
                MarsView()
                MarsView()
                MarsView()
            }
            
            Spacer(minLength: 10)
            
        }
        .navigationBarTitle(Text("Wiki"),displayMode: .inline)
        }
    }
}

struct WikiView_Previews: PreviewProvider {
    static var previews: some View {
        WikiView()
    }
}
