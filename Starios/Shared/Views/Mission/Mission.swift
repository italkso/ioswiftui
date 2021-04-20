//
//  Mission.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct Mission: View {
    @State var showtMarkedOnly = true
    @State private var pickerIndex = 0
    @State private var showSheet = false

    var pickerOptions = ["Done", "Doing", "Todo"]

    var body: some View {
        NavigationView {
            VStack {
                FindView().padding()
                
                Toggle("Focus", isOn: $showtMarkedOnly)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.horizontal, 25)
                    .padding(.vertical)
                    .background(Color.orange)
                
                Picker("Picker", selection: $pickerIndex) {
                    ForEach(0 ..< pickerOptions.count) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 25)
                .padding(.vertical)
                
                if pickerIndex == 0 {
                    MissionListView()
                } else if pickerIndex == 1 {
                    EmptyView()
                } else {
                    EmptyView()
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Mission"), displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                   // TODO: - Countdown
                    self.showSheet = true
                }) {
                    Image(systemName: "alarm")
                        .imageScale(.large).foregroundColor(.blue)
                }
            ).sheet(isPresented: $showSheet) { CountdownView() }
        }
    }
}

struct Mission_Previews: PreviewProvider {
    static var previews: some View {
        Mission()
    }
}
