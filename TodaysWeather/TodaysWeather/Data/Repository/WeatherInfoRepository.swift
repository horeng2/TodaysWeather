//
//  WeatherInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoRepository {
    typealias ResponseType = WeatherRawData
    
    private let apiProvider = APIProvider()
    
    func loadWeatherData(
        by cityGeoInfo: GeoInfo,
        completionHandler: @escaping (Data) -> Void
    ) {
        apiProvider.request(requestType: WeatherInfoRequest(cityGeoInfo: cityGeoInfo)) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                completionHandler(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
