//
//  TodaysWeatherInfoSevice.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoService {
    let weatherInfoRepository = WeatherInfoRepository()
    let geoInfoService = GeoInfoService()

    func fetchWeatherInfo(city: City, completionHandler: @escaping (Result<WeatherInfo, NetworkError>) -> Void) {
        guard let geoInfo = geoInfoService.totalGeoInfo[city] else {
            return
        }
        self.weatherInfoRepository.fetchWeatherInfo(by: geoInfo) { (result: Result<WeatherInfo, NetworkError>) in
            switch result {
            case .success(let weatherInfo):
                completionHandler(.success(weatherInfo))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
