//
//  AddMission.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

struct AddMission: View {
        @Environment(\.presentationMode) var presentationMode
        
        @StateObject var missionData = MissionData()
        @State var titleInput = ""
        @State var contentInput = "Write something..."
        @Binding var isMarked: Bool
    
        
         var body: some View {
            VStack(alignment:.center,spacing:20) {
                HStack(alignment: .center, spacing: 10) {
                    TextField("Mission", text: $titleInput)
                        .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: .accentColor, radius: 15, x: 0.0, y: 0.0)
                }
                
                TextEditor(text: $contentInput)
                    .font(.body)
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                    .border(Color.accentColor, width: 1.5)
                    .padding(.horizontal)
                
                    
                
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        RoundedButton(text: "Cancle", image: "xmark.seal.fill")
                    }// Cancle Button
                    
                    if titleInput != "" && contentInput != "" {
                        Button(action: {
                            
                            let id = UUID()
                            let newMission = MarsMission(id: id, title: titleInput, content: contentInput)
                            
                            missionData.missions.append(newMission)
                            missionData.saveMissions()
                            titleInput = ""
                            contentInput = "Write something..."
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            RoundedButton(text: "Save", image: "checkmark.seal.fill")
                            
                        }// Save Button
                    }
                }
            }.padding()
         }
    }

struct AddMission_Previews: PreviewProvider {
    static var previews: some View {
        AddMission(isMarked: .constant(true))
    }
}
