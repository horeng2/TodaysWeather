//
//  TemperatureSybol.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import Foundation

enum TemperatureUnit {
    case humidity
    case celsius
    case fahrenheit
    case windSpeed
    case pressure

    func symbol() -> String {
        switch self {
        case .humidity:
            return "%"
        case .celsius:
            return "ºC"
        case .fahrenheit:
            return "ºF"
        case .windSpeed:
            return "m/s"
        case .pressure:
            return "hPa"
        }
    }
}
