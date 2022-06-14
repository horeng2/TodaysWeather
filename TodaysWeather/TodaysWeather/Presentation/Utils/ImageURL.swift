//
//  String+Extension.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/14.
//

import Foundation

enum ImageURL {
    case icon
    
    func url(key: String) -> String {
        switch self {
        case .icon:
            return "http://openweathermap.org/img/wn/\(key)@2x.png"
        }
    }
}
