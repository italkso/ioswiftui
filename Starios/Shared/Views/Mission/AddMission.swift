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
        @State var contentInput = ""
        @Binding var isMarked: Bool
    
        
         var body: some View {
            VStack(alignment:.center,spacing:20) {
                HStack(alignment: .center, spacing: 20) {
                    TextField("Mission", text: $titleInput)
                        .font(.title)
                        .foregroundColor(.accentColor)
                }
                
                Divider()
                TextEditor(text: $contentInput)
                    .font(.body)
                    .foregroundColor(.secondary)
                    
                
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        RoundedButton(text: "Cancle", image: "")
                    }// Cancle Button
                    
                    if titleInput != "" && contentInput != "" {
                        Button(action: {
                            
                            let id = UUID()
                            let newMission = MarsMission(id: id, title: titleInput, content: contentInput)
                            
                            missionData.missions.append(newMission)
                            missionData.saveMissions()
                            titleInput = ""
                            contentInput = ""
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            RoundedButton(text: "Save", image: "")
                        }// Save Button
                    } else {
                        Button(action: {
                            
                        }) {
                            RoundedButton(text: "Save", image: "")
                        }
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
