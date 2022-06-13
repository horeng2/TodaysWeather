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
    var allWeatherInfoUpdated: () -> Void = {}
    var allWeatherInfo: [WeatherInformation] = [] {
        didSet {
            if allWeatherInfo.count == City.allCases.count {
                self.allWeatherInfo = self.allWeatherInfo.sorted {
                    $0.cityName < $1.cityName
                }
                self.allWeatherInfoUpdated()
            }
        }
    }
    
    func fetchAllWeatherInfo() {
        self.allWeatherInfo.removeAll()
        City.allCases.forEach { city in
            fetchWeatherInfo(of: city) { weatherInfo in
                self.allWeatherInfo.append(weatherInfo)
            }
        }
    }
    
    func fetchWeatherInfo(of city: City, completionHandler: @escaping (WeatherInformation) -> Void) {
        self.geoInfoService.decodeGeoInfo(of: city) { geoInfo in
            self.weatherInfoService.loadWeatherInfomation(at: geoInfo) { weatherInfo in
                completionHandler(weatherInfo)
            }
        }
    }
}
