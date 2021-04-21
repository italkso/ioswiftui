//
//  MissionsList.swift
//  Starios
//
//  Created by aaron on 2021/4/21.
//

import SwiftUI

struct MissionsList: View {
   
    @ObservedObject var missionData = MissionData()
    
    @State private var showSheet = false
   
    @State private var showMarkedOnly = false
    
    @State private var searchText = ""
    
    @State var isMarked = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                FindView(title: self.$searchText ).padding()
                
                List {
                    Toggle(isOn: $showMarkedOnly) {
                            Text("Marked")
                        .font(.system(size: 20))
                        .foregroundColor(.accentColor)
                    }
                    
                    ForEach(self.missionData.missions.filter({ mission in
                        
                        searchText.isEmpty ? true : mission.title.contains(searchText)
                        
                    })) {  mission in
                        if !self.showMarkedOnly || self.isMarked {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack{
                                    Text(mission.title)
                                    .font(.title3)
                                    .bold()
                                    Spacer()
                                }
                                Text(mission.content)
                            }.contextMenu(
                                ContextMenu(menuItems: {
                                Text("Share")
                            }))
                        }
                    }
                    .onDelete(perform: deleteListItem)
                    .onMove(perform: moveListItem)
                }.listStyle(InsetGroupedListStyle())
                
                Spacer(minLength: 10)
            }
            .navigationBarItems(
                leading:
                    EditButton(),
                trailing:
                    Button(action: {
                        self.showSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large).foregroundColor(.accentColor)
                    }
                ).sheet(isPresented: $showSheet) {
                    // Save new notes
                    AddMission(isMarked: $isMarked)
                }
        }
    }
    
    func deleteListItem(at offsets: IndexSet) {
        missionData.missions.remove(atOffsets: offsets)
        missionData.saveMissions()
    }
    func moveListItem(from source: IndexSet, to destination: Int) {
        missionData.missions.move(fromOffsets: source, toOffset: destination)
    }
}

struct MissionsList_Previews: PreviewProvider {
    static var previews: some View {
        MissionsList()
    }
}
