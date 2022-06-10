//
//  GeoInfoService.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoService {
    let geoRepository = GeoInfoRepository()
    var totalGeoInfo = [City: GeoInfo]()
    
    init() {
        City.allCases.forEach { city in
            self.fetchGeoInfo(city: city)
        }
    }
    
    func fetchGeoInfo(city: City) {
        self.geoRepository.fetchGeoInfo(of: city) { (result: Result<GeoInfo, NetworkError>) in
            switch result {
            case .success(let geoInfo):
                self.totalGeoInfo.updateValue(geoInfo, forKey: city)
            case .failure(_):
                return
            }
        }
    }
    
    func geoInfoOfAllCities() -> [City: GeoInfo] {
        return self.totalGeoInfo
    }
}
