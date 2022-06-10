//
//  GeoInfoService.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoService {
    let geoRepository = GeoInfoRepository()
    
    var geoInfoUpdated: () -> Void = {}
    var totalGeoInfo = [City: GeoInfo]()
    {
        didSet {
            geoInfoUpdated()
        }
    }
    
    init() {
        City.allCases.forEach { city in
            self.fetchGeoInfo(city: city) { geoInfo in
                self.totalGeoInfo.updateValue(geoInfo, forKey: city)
            }
        }
    }
    
    func fetchGeoInfo(city: City, onCompleted: @escaping (GeoInfo) -> Void) {
        geoRepository.fetchGeoInfo(of: city) { entity in
            guard let geoInfo = try? JSONDecoder().decode(GeoInfo.self, from: entity) else {
                return
            }
            onCompleted(geoInfo)
        }
    }
    
    func fetchOfAllCityGeoInfo() {
        var totalGeoInfo = [City: GeoInfo]()
        City.allCases.forEach { city in
            self.fetchGeoInfo(city: city) { geoInfo in
                totalGeoInfo.updateValue(geoInfo, forKey: city)
            }
        }
        self.totalGeoInfo = totalGeoInfo
    }
}
