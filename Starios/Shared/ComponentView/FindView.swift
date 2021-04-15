//
//  FindView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct FindView: View {
    
    @State var searchItem = ""
    @State private var isSearching = false
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search",text: $searchItem)
                    .font(.subheadline)
                    .padding()
                    .padding(.horizontal, 25)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .secondary, radius: 2, x: 0.0, y: 0.0)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                                .foregroundColor(isSearching ?  .primary : .secondary)
                                .frame(minWidth: 0 , maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal,10)
                     
                            if isSearching {
                                Button(action: {
                                    self.searchItem = ""
                                }) {
                                    Image(systemName: "multiply")
                                        .imageScale(.small)
                                        .foregroundColor(.primary)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        self.isSearching = true
                    }
                if isSearching {
                    Button(action: {
                        self.isSearching = false
                        self.searchItem = ""
                        
                        // Hide Keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }){
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.trailing,10)
                        
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut)
                }
            }
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
