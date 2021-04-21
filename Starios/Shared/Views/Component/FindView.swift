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
                    .font(.headline)
                    .padding()
                    .padding(.horizontal, 25)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.small)
                                .foregroundColor(isSearching ?  .orange : .green)
                                .frame(minWidth: 0 , maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal,10)
                     
                            if isSearching {
                                Button(action: {
                                    self.searchItem = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .imageScale(.small)
                                        .foregroundColor(.orange)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    )
                    .overlay(
                        Capsule().stroke(Color( self.isSearching ? .orange : .gray))
                    )
                    .padding(10)
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
                            .foregroundColor(.orange)
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
        FindView()
    }
}
