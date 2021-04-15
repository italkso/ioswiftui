//
//  CityWeatherInfoView.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import SwiftUI

struct CityWeatherInfoView: View {
    var weather: Weather?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(weather?.name ?? "Unkonwn")")
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .foregroundColor(.orange)
            HStack(alignment: .top, spacing: 30) {
                CurrentTimeView()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tempature: \(String(format: "%.0f", weather?.main.temp ?? 0)) ºC")
                        .bold()
                    Text("Humidity: \(String(format: "%.0f", weather?.main.humidity ?? 0)) %")
                }.font(.subheadline)
            }
        }.padding()
    }
}

struct CityWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherInfoView(weather: Weather.all())
    }
}
