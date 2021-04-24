//
//  CityWeatherInfo.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct CityWeatherInfo: View {
    var weather: Weather?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(weather?.name ?? "Unkonwn")")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) {
                HStack {
                    Text("Tempature : \(String(format: "%.0f", weather?.main.temp ?? 0)) ºC")
                        .bold()
                    Spacer()
                    Text("Humidity : \(String(format: "%.0f", weather?.main.humidity ?? 0)) %")
                        .bold()
                }.font(.subheadline).padding(.vertical)
            }
        }.padding(.horizontal)
    }
}

struct CityWeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherInfo(weather: Weather.all())
    }
}
