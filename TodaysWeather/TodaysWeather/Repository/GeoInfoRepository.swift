//
//  GeoInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoRepository {
    let urlSessionProvider = APIProvider()
    
    func fetchGeoInfo(of city: City, completionHandler: @escaping (Result<GeoInfo, NetworkError>) -> Void) {
        urlSessionProvider.request(requestType: GeoInfoRequest(city: city)) { (result: Result<GeoInfo, NetworkError>) in
            switch result {
            case .success(let decodedData):
                completionHandler(.success(decodedData))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
