//
//  ContentView.swift
//  Shared
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct Home: View {
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView {
            ZStack {
//                Image("astronaut")
//                    .edgesIgnoringSafeArea(.horizontal)
                VStack(alignment: .center, spacing: 50) {
                    Text("Let's go to Mars")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                    
                    FindView(searchItem: "")
                        .frame(width: UIScreen.main.bounds.width / 1.05, height: UIScreen.main.bounds.height / 10, alignment: .center)
                    
                    VisitNASAInApp().padding(.vertical)
                    
                }.padding()
            }
            .toolbar {
                DarkModeSwitch(darkMode: $darkMode)
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
