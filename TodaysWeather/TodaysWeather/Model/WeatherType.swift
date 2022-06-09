//
//  WeatherCondition.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

enum WeatherType: String, Decodable {
    case clear = "맑음"
    case cloudy = "구름 많음"
    case overcast = "흐림"
    case rainy = "비"
    case snow = "눈"
}
