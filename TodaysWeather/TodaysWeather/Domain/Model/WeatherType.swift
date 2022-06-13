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
        switch self {
        case .clear:
            return "오늘은 맑아요."
        case .cloudy:
            return "오늘은 구름이 있어요."
        case .overcast:
            return "오늘은 흐려요"
        case .rain:
            return "오늘은 비가 와요."
        case .snow:
            return "오늘은 눈이 와요!"
        case .unknown:
            return ""
        }
    }
}
