//
//  EarthVsMarsView.swift
//  Starios
//
//  Created by aaron on 2021/4/16.
//

import SwiftUI

struct EarthVsMarsView: View {
    @State var showActionSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Comparison")
                .foregroundColor(.accentColor)
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
            
                
                GroupBox(label: Label("Earth", systemImage: "leaf.fill").foregroundColor(.blue)) {
                    HStack {
                        Text("1 Moon, 1 Earth Year( 365.25 days)").padding()
                        Spacer()
                    }
                }.padding(.vertical)
                
                GroupBox(label: Label("Mars", systemImage: "leaf.fill").foregroundColor(.red)) {
                    HStack {
                        Text("2 Moons, 1.88 Earth Years").padding()
                        Spacer()
                    }
                }.padding(.vertical)
            

            // MARK: - ActionSheet
            HStack(alignment:.center, spacing:20) {
                
                Spacer()
                
                Button(action: {
                        showActionSheet.toggle()
                    }) {
                    Text("Copy - ActionSheet").font(.headline)
                    }
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(title: Text("Wanna Copy?"), message: Text("Feel free to copy it"), buttons: [
                            .default(Text("Copy")) { },
                            .destructive(Text("Delete")) { },
                            .cancel()
                        ])
                }
                
                Spacer()
            }
            
        }.padding()
    }
}

struct EarthVsMarsView_Previews: PreviewProvider {
    static var previews: some View {
        EarthVsMarsView()
    }
}
