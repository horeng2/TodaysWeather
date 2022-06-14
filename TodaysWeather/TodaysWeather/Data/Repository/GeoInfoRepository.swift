//
//  GeoInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class GeoInfoRepository {
    typealias ResponseType = GeoInfo

    private let apiProvider = APIProvider()
        
    func loadGeoData(
        of city: City,
        completionHandler: @escaping (Data) -> Void
    ) {
        apiProvider.request(requestType: GeoInfoRequest(city: city)) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                completionHandler(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
