//
//  GeoInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoRepository: Decodable {
    func fetchGeoInfo(of city: City, onCompleted: @escaping (Data) -> Void) {
        guard let url = GeoInfoRequest(city: city).url else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            onCompleted(data)
        }.resume()
    }
}
