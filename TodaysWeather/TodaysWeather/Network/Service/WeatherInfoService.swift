//
//  TodaysWeatherInfoSevice.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoService {
    let weatherInfoRepository = WeatherInfoRepository()
    
    func fetchWeatherInfo(geoInfo: GeoInfo, completionHandler: @escaping (Result<WeatherInfo, NetworkError>) -> Void) {
        self.weatherInfoRepository.fetchWeatherInfo(by: geoInfo) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                guard let weatherInfo = try? JSONDecoder().decode(WeatherInfo.self, from: data) else {
                    return
                }
                completionHandler(.success(weatherInfo))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
