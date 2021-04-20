//
//  DarkModeSwitch.swift
//  Starios
//
//  Created by aaron on 2021/4/19.
//

import SwiftUI

struct DarkModeSwitch: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        Button(action: {
            darkMode.toggle()
        }) {
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
                .font(.system(.headline, design:.rounded))
        }
    }
}

struct DarkModeSwitch_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeSwitch(darkMode: .constant(false))
    }
}
