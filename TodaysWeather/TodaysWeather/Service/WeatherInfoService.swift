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
    
    var weatherInfoUpdated: () -> Void = {}

    var totalWeatherInfo = [City: WeatherInfo]()
    {
        didSet {
            if totalWeatherInfo.count == City.allCases.count {
                weatherInfoUpdated()
            }
        }
    }
    
    init() {
        self.fetchOfAllCityWeatherInfo()
    }
    
    func fetchOfAllCityWeatherInfo() {
        City.allCases.forEach { city in
            guard let geoInfo = self.geoInfoService.totalGeoInfo[city] else {
                return
            }
            self.weatherInfoRepository.fetchWeatherInfo(by: geoInfo) { (result: Result<WeatherInfo, NetworkError>) in
                switch result {
                case .success(let weatherInfo):
                    self.totalWeatherInfo.updateValue(weatherInfo, forKey: city)
                case .failure(_):
                    return
                }
            }
        }
    }
}
