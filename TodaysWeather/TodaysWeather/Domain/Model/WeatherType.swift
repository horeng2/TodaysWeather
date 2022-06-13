//
//  WeatherType.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import Foundation

enum WeatherType {
    case clear
    case cloudy
    case overcast
    case rain
    case snow
    case unknown
    
    func description() -> String {
        return "\(self)".localized
    }
}
