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
    
    func fetchWeatherInfo(by cityGeoInfo: GeoInfo, completionHandler: @escaping (Result<WeatherInfo, NetworkError>) -> Void) {
        apiProvider.request(requestType: WeatherInfoRequest(cityGeoInfo: cityGeoInfo)) { (result: Result<WeatherInfo, NetworkError>) in
            switch result {
            case .success(let decodedData):
                completionHandler(.success(decodedData))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
