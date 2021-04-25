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
                FindView(title: self.$searchText).padding()

                List {
                    Toggle(isOn: $showMarkedOnly) {
                        Text("Marked")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.orange)
                    }.toggleStyle(DefaultToggleStyle())

                    ForEach(self.missionData.missions.filter({ mission in

                        searchText.isEmpty ? true : mission.title.contains(searchText)

                    })) { mission in
                        if !self.showMarkedOnly || self.isMarked {
                            HStack(alignment: .top, spacing: 10) {
                                VStack(alignment: .leading,spacing:5) {
                                    Text(mission.title)
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                        .bold()
                                        .padding(.vertical, 5)
                                    Text(mission.content)
                                        .font(.footnote)
                                        .lineLimit(1)
                                }
                                Spacer()
                                if mission.imageURLAppendix != nil {
                                    Image(uiImage: missionData.getImages(mission.imageURLAppendix!))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(5)
                                        .padding(.vertical)
                                }
                            }
                            .contextMenu(
                                ContextMenu(menuItems: {
                                    Text("Share")
                                }))
                        }
                    }
                    .onDelete(perform: deleteListItem)
                    .onMove(perform: moveListItem)
                    .onAppear { UITableView.appearance().separatorStyle = .none }
                    .animation(.default)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .cornerRadius(5)
                }.listStyle(InsetGroupedListStyle())

                Spacer(minLength: 15)
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
