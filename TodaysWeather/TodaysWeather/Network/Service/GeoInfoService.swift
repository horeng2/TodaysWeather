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
        self.geoRepository.loadGeoData(of: city) { geoRawData in
            guard let decodedGeoData = try? JSONDecoder().decode([GeoInfo].self, from: geoRawData).first else {
                print("GeoInfo \(NetworkError.parsingError)")
                return
            }
            completionHandler(decodedGeoData)
            return
        }
    }
}
