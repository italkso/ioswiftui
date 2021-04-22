//
//  CurrentTimeView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct CurrentTimeView: View {
    var currentTime = Date()
    
    var body: some View {
        let formattedCurrTime = getFormattedCurrTime(format: "HH : mm : ss")
            let formattedCurrDate = getFormattedCurrTime(format: "EEEE, MMMM dd")
        
        return VStack(alignment: .center, spacing: 10) {
            Text("\(formattedCurrTime)").bold()
            Text("\(formattedCurrDate)")
        }
        .font(.subheadline)
        .foregroundColor(.accentColor)
        
    }
    
    func getFormattedCurrTime(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: currentTime)
    }
}

struct CurrentTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTimeView()
    }
}
