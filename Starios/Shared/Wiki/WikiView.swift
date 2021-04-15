//
//  WikiView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct WikiView: View {
    @State private var pickerIndex = 0
    var pickerOptions = ["Mars", "Earth"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Picker", selection: $pickerIndex) {
                    ForEach(0 ..< pickerOptions.count) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle()).padding()
                if pickerIndex == 0 {
                    MarsView()
                } else {
                    EarthView()
                }
                

                Spacer()
            }.navigationBarTitle(Text("Wiki"), displayMode: .inline)
        }
    }
}

struct WikiView_Previews: PreviewProvider {
    static var previews: some View {
        WikiView()
    }
}
