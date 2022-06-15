//
//  TodaysWeatherInfo.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

struct WeatherData: Decodable {
    let basicsInfo: [WeatherBasicsInfo]
    let detailInfo: WeatherDetail
    let windCondition: WindCondition
    let cityName: String
    
    private enum CodingKeys: String, CodingKey {
        case basicsInfo = "weather"
        case detailInfo = "main"
        case windCondition = "wind"
        case cityName = "name"
    }
}
