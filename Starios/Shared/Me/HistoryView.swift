//
//  HistoryView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
                Text("History")
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
