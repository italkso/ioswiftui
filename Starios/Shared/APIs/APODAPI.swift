//
//  APODAPI.swift
//  Starios
//
//  Created by aaron on 2021/4/18.
//

import SwiftUI

// MARK: - Model
struct Picture: Codable {
    var title: String
    var date: Date
    var copyright: String
    var explanation: String
}// Astronomy Picture of the Day

// MARK: - ViewModel
class APOD: ObservableObject {
    @Published var pictures = [Picture]()

    init() {
        //MARK: - URLSession
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=a8mcSvvH2HDSFm2Xt17DKFwywl9MYb3GA01ZRgIp")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.pictures = try! JSONDecoder().decode([Picture].self, from: data!)
            }
        }.resume()
    }
}
