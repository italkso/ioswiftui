//
//  Weather.swift
//  Starios
//
//  Created by aaron on 2021/4/14.
//

import Foundation

struct Weather: Decodable {
    let coord: Coordinate
    let name: String
    let visibility: Int
    let main: Main
    let wind: Wind
}

struct Coordinate: Decodable {
    let lat, lon: Double
}

struct Main: Decodable {
    let temp, pressure, humidity: Double
}

struct Wind: Decodable {
    let speed: Double
}

extension Weather {
    static func all() -> Weather {
        Weather(coord: Coordinate(lat: 37.785834, lon: -122.406417), name: "City",
            visibility: 00,
            main: Main(temp: 00, pressure: 00, humidity: 00),
            wind: Wind(speed: 0.0)
        )
    }
}

