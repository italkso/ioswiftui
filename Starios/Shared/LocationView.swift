//
//  LocationView.swift
//  Starios
//
//  Created by aaron on 2021/4/12.
//

import SwiftUI

struct LocationView: View {
    var weather: Weather?
    @ObservedObject var weatherAPI = WeatherAPI()
    @State private var isSearching = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
            // MARK: - Input Field
//            FindView()
            
            // MARK: - Map
            MapView(weather: weatherAPI.weather ?? Weather.all())
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            
            
            // MARK: - Weather Info
            CityWeatherInfoView(weather: weatherAPI.weather ?? Weather.all())
            
            TextField("Search like California", text: $weatherAPI.city, onCommit: { self.weatherAPI.getWeatherInfo(by: self.weatherAPI.city) })
                .font(.headline)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color(.systemGray6))
                .shadow(color: .secondary, radius: 2, x: 0.0, y: 0.0)

                .padding()
            
            Spacer(minLength: 10)
        }.navigationBarTitle(Text("Location"),displayMode: .inline)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
