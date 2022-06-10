//
//  WeatherInfoRepository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoRepository: Repository {
    typealias ResponseType = TodaysWeather
    
    let apiProvider = APIProvider()
    
    func fetchInfo(of city: City, completionHandler: @escaping (Result<TodaysWeather, NetworkError>) -> Void) {
        apiProvider.request(requestType: WeatherInfoRequest(city: city)) { (result: Result<TodaysWeather, NetworkError>) in
            switch result {
            case .success(let decodedData):
                completionHandler(.success(decodedData))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
