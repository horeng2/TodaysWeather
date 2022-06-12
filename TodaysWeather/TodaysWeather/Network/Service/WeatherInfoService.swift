//
//  TodaysWeatherInfoSevice.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoService {
    let weatherInfoRepository = WeatherInfoRepository()
    
    func decodeWeatherInfo(at geoInfo: GeoInfo, completionHandler: @escaping (WeatherInfo) -> Void) {
        self.weatherInfoRepository.loadWeatherData(by: geoInfo) { weatherData in
            guard let decodedWeatherInfo = try? JSONDecoder().decode(WeatherInfo.self, from: weatherData) else {
                print("WeatherInfo \(NetworkError.parsingError)")
                return
            }
            completionHandler(decodedWeatherInfo)
        }
    }
}
