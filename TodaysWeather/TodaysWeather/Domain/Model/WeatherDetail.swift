//
//  WeatherCondition.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

struct WeatherDetail: Decodable {
    let currentTemperatures: Double
    let feelsTemperatures: Double
    let currentHumidity: Double
    let minimumTemperatures: Double
    let maximumTemperatures: Double
    let pressure: Double
    
    private enum CodingKeys: String, CodingKey {
        case currentTemperatures = "temp"
        case feelsTemperatures = "feels_like"
        case currentHumidity = "humidity"
        case minimumTemperatures = "temp_min"
        case maximumTemperatures = "temp_max"
        case pressure
    }
}
