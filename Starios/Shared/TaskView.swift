//
//  TaskView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct TaskView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                FindView().padding()
                Text("Task List Here").padding()
                EmptyView()
                CountdownView().edgesIgnoringSafeArea(.all)
            }.navigationBarTitle(Text("Task"),displayMode: .inline)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
