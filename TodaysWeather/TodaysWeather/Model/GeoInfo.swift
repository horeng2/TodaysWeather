//
//  GeoInfo.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

struct GeoInfo: Decodable {
    let latitude: Int
    let longitude: Int
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
