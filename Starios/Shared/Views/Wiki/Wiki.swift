//
//  Wiki.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct Wiki: View {
    @State private var pickerIndex = 0
    @State var showModal = false

    let pickerOptions = ["Mars", "Earth"]

    var body: some View {
        NavigationView {
            ScrollView {
               
                    VStack {
                    //  MARK: - Picker
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
                    
                    //  MARK: - Modal Demo
                    Button(action: {
                        showModal.toggle()
                    }) {
                        Text("Earth Vs Mars")
                    }.sheet(isPresented: $showModal) {
                        EarthVsMarsView()
                    }.font(.headline).padding()

                    Spacer()
                    }
                    
                   
                
            }
            .navigationBarTitle(Text("Wiki"), displayMode: .inline)
        }
    }
}

struct Wiki_Previews: PreviewProvider {
    static var previews: some View {
        Wiki()
    }
}
