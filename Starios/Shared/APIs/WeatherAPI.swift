//
//  WeatherAPI.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import Foundation

final class WeatherAPI: ObservableObject {
    
    @Published var weather: Weather?
    @Published var city = ""
    
    let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    var query = ["q": "", "appid": "", "units": "metric"]
    
    func getWeatherInfo(by city: String) {
        
        guard baseURL.withQueries(query) != nil, city != "" else { print("URL Error!"); return}
        
        query["appid"] = "7b9e2b19d463bf8d02f515c80c88f2e9"
        query["q"] = city
        
        //  MARK: - URLSession
        URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { data, _, error in
            print(self.baseURL.withQueries(self.query)!)
            guard let data = data else { print(#line, #function, "\(error!.localizedDescription)"); return }
            
            if let weatherInfo = try? JSONDecoder().decode(Weather.self, from: data) {
                DispatchQueue.main.async { [weak self] in
                    self?.weather = weatherInfo
                }
            } else {
                print(#line, #function, "Wrong input"); return
            }
        }.resume()
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.key, value: $0.value)}
        return components?.url
    }
}

