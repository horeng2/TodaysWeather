//
//  GeoInfoService.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoService {
    let geoRepository = GeoInfoRepository()
    
    func decodeGeoInfo(of city: City, completionHandler: @escaping (GeoInfo) -> Void) {
        self.geoRepository.loadGeoData(of: city) { geoData in
            guard let decodedGeoInfo = try? JSONDecoder().decode([GeoInfo].self, from: geoData).first else {
                print("GeoInfo \(NetworkError.parsingError)")
                return
            }
            completionHandler(decodedGeoInfo)
        }
    }
}
