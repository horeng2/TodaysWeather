//
//  WeatherListViewModel.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherListViewModel {
    let weatherInfoService = WeatherInfoService()
    let geoInfoService = GeoInfoService()

    func fetchWeatherInfo(of city: City, completionHandler: @escaping (WeatherInfo) -> Void) {
        self.geoInfoService.decodeGeoInfo(of: city) { geoInfo in
            self.weatherInfoService.decodeWeatherInfo(at: geoInfo) { weatherInfo in
                completionHandler(weatherInfo)
            }
        }
    }
}
