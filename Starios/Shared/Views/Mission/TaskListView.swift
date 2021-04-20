//
//  MissionListView.swift
//  Starios
//
//  Created by aaron on 2021/4/15.
//

import SwiftUI

struct MissionListView: View {
    @State private var tasks = ["Mission 1", "Mission 2", "Mission 3", "Mission 4","Mission 5", "Mission 6", "Mission 7", "Mission 8"]

    var body: some View {
        List {
            ForEach(tasks, id: \.self) { task in
                Text(task)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(Color(red: 245 / 255, green: 246 / 255, blue: 250 / 255))
                    .cornerRadius(8)
                    .contextMenu(ContextMenu(menuItems: {
                        Text("取消")
                        Text("标记")
                        Text("分享")
                    }))
            }
            .onMove(perform: moveListItem)
        }
    }

    func moveListItem(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
