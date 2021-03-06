//
//  Weather.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

struct WeatherBasicsInfo: Decodable {
    let weatherID: Int
    let weatherCondition: String
    let description: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case weatherID = "id"
        case weatherCondition = "main"
        case description
        case icon
    }
}
