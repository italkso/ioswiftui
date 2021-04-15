//
//  TaskView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct TaskView: View {
    @State var showtMarkedOnly = true

    var body: some View {
        NavigationView {
            VStack {
                FindView().padding()
                Toggle("Future Tasks", isOn: $showtMarkedOnly)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.horizontal, 25)
                    .padding(.vertical)
                    .font(.headline)
                    .background(Color.orange)
                    .opacity(0.9)
                TaskListView().padding()
            }
            .navigationBarTitle(Text("Task"), displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                   // TODO: - Countdown
                }) {
                    Image(systemName: "alarm")
                        .imageScale(.large).foregroundColor(.blue)
                }
            )
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
