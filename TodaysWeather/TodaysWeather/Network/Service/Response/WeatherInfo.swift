//
//  TodaysWeatherInfo.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

struct WeatherInfo: Decodable {
    let weatherBasicsInfo: [WeatherBasicsInfo]
    let weatherCondition: WeatherCondition
    let systemInfo: SystemInfo
    let cityName: String
    
    private enum CodingKeys: String, CodingKey {
        case weatherBasicsInfo = "weather"
        case weatherCondition = "main"
        case systemInfo = "sys"
        case cityName = "name"
    }
}
