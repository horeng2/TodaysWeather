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
    let geoInfo: [City: GeoInfo]
    
    var weatherInfoUpdated: () -> Void = {}
    var totalWeatherInfo = [City: WeatherInfo]()
    {
        didSet {
            if self.totalWeatherInfo.count == City.allCases.count {
                self.weatherInfoUpdated()
            }
        }
    }
    
    init() {
        self.geoInfo = self.geoInfoService.geoInfoOfAllCities()
    }
    
    func fetchWeatherList() {
        City.allCases.forEach { city in
            guard let geoInfo = self.geoInfo[city] else {
                return
            }
            self.fetchWeatherInfo(city: city, geoInfo: geoInfo)
        }
    }
    
    func fetchWeatherInfo(city: City, geoInfo: GeoInfo) {
        guard let geoInfo = self.geoInfoService.totalGeoInfo[city] else {
            return
        }
        self.weatherInfoService.fetchWeatherInfo(geoInfo: geoInfo) { (result: Result<WeatherInfo, NetworkError>) -> Void in
            switch result {
            case .success(let weatherInfo):
                self.totalWeatherInfo.updateValue(weatherInfo, forKey: city)
            case .failure(_):
                return
            }
        }
    }
}
