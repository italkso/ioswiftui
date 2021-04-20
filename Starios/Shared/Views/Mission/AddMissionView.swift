//
//  AddMission.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

struct AddMission: View {
        
        @Environment(\.managedObjectContext) var context
        
        @Binding var missionText: String
        @State private var isEditing = false
        @State private var isMarked = false
        
        
        
        let defaultText = "Add Task"
        
         var body: some View {
            VStack(alignment: .center, spacing: 20){
                HStack(alignment:.center){
                    
                    TextField("\(defaultText)",text: $missionText)
                         .padding(10)
                         .padding(.horizontal, 25)
                         .background(Color(isEditing ? .systemGroupedBackground : .systemGray6))
                         .clipShape(Capsule())
                         .overlay(
                             HStack {
                                 Image(systemName: "pencil.and.outline")
                                     .foregroundColor(.secondary)
                                     .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                     .padding(.leading, 10)
                          
                                 if isEditing {
                                     Button(action: {
                                         self.missionText = ""
                                     }){
                                            Image(systemName: "multiply.circle.fill")
                                                 .foregroundColor(.black)
                                                 .padding(.trailing, 10)
                                     }
                                 }
                             }
                         ).cornerRadius(15)
                        .overlay(Capsule().stroke(Color( self.isEditing ? .orange : .white)))
                         .padding(.horizontal, 10)
                         .onTapGesture {
                             self.isEditing = true
                         }
                    
                     if isEditing {
                         Button(action: {
                             self.isEditing = false
                             self.missionText = ""
                             // Hide keyboard
                             UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                         }){
                            Text("Cancel").foregroundColor(.blue).padding(.trailing)
                         }
                         .padding(.horizontal,5)
                         .transition(.move(edge: .trailing))
                     }
                    
                    
                    
                    // Save
                    if missionText != "" {
                        
                        MarkView(isMarked: $isMarked)
                            .foregroundColor(.green)
                            .animation(.default)
                        
                        Button(action: {
                           let missionItem = MissionItem(context: self.context)
                            missionItem.missionText = self.missionText
                            missionItem.createdDate = Date()
                            missionItem.isMarked = self.isMarked
                            
                           try? self.context.save()
                                
                           self.missionText = ""
                           self.isEditing = false
                           self.isMarked = false
                            
                           // Hide keyboard
                           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                       }){
                           Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.green)
                                .animation(.default)
                       }
                    }
                 }
                     .padding(5)
                     .frame(width: UIScreen.main.bounds.width)
                     .padding(5)
            }
         }
    }

struct AddMission_Previews: PreviewProvider {
    static var previews: some View {
        AddMission(missionText: .constant(""))
    }
}
