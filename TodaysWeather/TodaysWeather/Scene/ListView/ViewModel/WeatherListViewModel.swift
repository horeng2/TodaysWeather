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
    var test: () -> Void = {}
    var allData: [WeatherInformation] = [] {
        didSet {
            if allData.count == City.allCases.count {
                self.test()
            }
        }
    }
    
    func allFetch() {
        self.allData.removeAll()
        City.allCases.forEach { city in
            fetchWeatherInfo(of: city) { weatherInfo in
                self.allData.append(weatherInfo)
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
