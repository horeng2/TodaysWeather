//
//  WeatherInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoRepository {
    typealias ResponseType = WeatherInfo
    
    let apiProvider = APIProvider()
    
    func fetchWeatherInfo(by cityGeoInfo: GeoInfo, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        apiProvider.request(requestType: WeatherInfoRequest(cityGeoInfo: cityGeoInfo)) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
