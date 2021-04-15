//
//  MarkView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct MarkView: View {
    
    @Binding var isMarked: Bool
    @State private var enabled = false
    
    var body: some View {
            Button(action: {
                self.enabled.toggle()
            }){
                    Image(systemName: "checkmark.seal.fill")
                        .imageScale(.medium)
                        .foregroundColor(enabled ? .orange : .green)
                        .rotationEffect(Angle(degrees: 30))
                        .animation(.default)
                        .onTapGesture {
                            self.isMarked = true
                            self.enabled = true
                    }
            }
    }
}

struct AddMarkView_Previews: PreviewProvider {
    static var previews: some View {
        MarkView(isMarked: .constant(true))
    }
}

