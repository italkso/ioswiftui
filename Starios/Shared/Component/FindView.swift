//
//  FindView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct FindView: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var title: String
    @State private var isSearching = false
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search",text: $title)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal, 20)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.medium)
                                .foregroundColor(isSearching ?  .blue : .orange)
                                .frame(minWidth: 0 , maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal,10)
                     
                            if isSearching {
                                Button(action: {
                                    self.title = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.accentColor)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    )
                    .overlay(
                        Capsule().stroke(Color( self.isSearching ? .orange : .gray))
                    )
                    .onTapGesture {
                        self.isSearching = true
                    }
                
                if isSearching {
                    Button(action: {
                        self.isSearching = false
                        self.title = ""
                        
                        // Hide Keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }){
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.accentColor)
                            .padding(.trailing,10)
                        
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut(duration: 0.08))
                }
            }
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView(title: .constant(""))
    }
}
