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
            if totalGeoInfo.count == City.allCases.count {
                geoInfoUpdated()
            }
        }
    }
    
    init() {
        self.fetchOfAllCityGeoInfo()
    }

    func fetchOfAllCityGeoInfo() {
        City.allCases.forEach { city in
            self.geoRepository.fetchGeoInfo(of: city) { (result: Result<GeoInfo, NetworkError>) in
                switch result {
                case .success(let geoInfo):
                    self.totalGeoInfo.updateValue(geoInfo, forKey: city)
                case .failure(_):
                    return
                }
            }
        }
    }
}
