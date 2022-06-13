//
//  TodaysWeatherInfoSevice.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoService {
    let weatherInfoRepository = WeatherInfoRepository()
    
    func loadWeatherInfomation(at geoInfo: GeoInfo, completionHandler: @escaping (WeatherInformation) -> Void) {
        self.decodeWeatherInfo(at: geoInfo) { weatherRawData in
            guard let basicInfo = weatherRawData.basicsInfo.first else {
                return
            }
            let weatherInfomation = WeatherInformation(
                weatherCondition: basicInfo.weatherCondition,
                description: basicInfo.description,
                iconCode: basicInfo.icon,
                currentTemperatures: weatherRawData.detailInfo.currentTemperatures.roundToInt(),
                feelsTemperatures: weatherRawData.detailInfo.feelsTemperatures.roundToInt(),
                currentHumidity: weatherRawData.detailInfo.currentHumidity.roundToInt(),
                minimumTemperatures: weatherRawData.detailInfo.minimumTemperatures.roundToInt(),
                maximumTemperatures: weatherRawData.detailInfo.maximumTemperatures.roundToInt(),
                pressure: weatherRawData.detailInfo.pressure.roundToInt(),
                windSpeed: weatherRawData.windCondition.speed.roundToInt(),
                cityName: weatherRawData.cityName
            )
            completionHandler(weatherInfomation)
        }
    }
    
    func decodeWeatherInfo(at geoInfo: GeoInfo, completionHandler: @escaping (WeatherRawData) -> Void) {
        self.weatherInfoRepository.loadWeatherData(by: geoInfo) { weatherRawData in
            guard let decodedWeatherData = try? JSONDecoder().decode(WeatherRawData.self, from: weatherRawData) else {
                print("WeatherInfo \(NetworkError.parsingError)")
                return
            }
            
            
            completionHandler(decodedWeatherData)
        }
    }
}
