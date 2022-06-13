//
//  Wind.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import Foundation

struct WindCondition: Decodable {
    var speed: Double
    
    private enum CodingKeys: CodingKey {
        case speed
    }
}
