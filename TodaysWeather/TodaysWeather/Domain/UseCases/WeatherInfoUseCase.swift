//
//  TodaysWeatherInfoSevice.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

class WeatherInfoUseCase {
    private let weatherInfoRepository = WeatherInfoRepository()
    
    func loadWeatherInfomation(
        at geoInfo: GeoInfo,
        completionHandler: @escaping (WeatherInformation) -> Void
    ) {
        self.decodeWeatherInfo(at: geoInfo) { weatherRawData in
            guard let basicInfo = weatherRawData.basicsInfo.first else {
                return
            }
            let weatherInfomation = WeatherInformation(
                weatherCondition: basicInfo.weatherCondition,
                description: self.convertDescription(from: basicInfo.weatherID),
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
    
    private func decodeWeatherInfo(
        at geoInfo: GeoInfo,
        completionHandler: @escaping (WeatherRawData) -> Void
    ) {
        self.weatherInfoRepository.loadWeatherData(by: geoInfo) { weatherRawData in
            guard let decodedWeatherData = try? JSONDecoder().decode(WeatherRawData.self, from: weatherRawData) else {
                print("WeatherInfo \(NetworkError.parsingError)")
                return
            }
            completionHandler(decodedWeatherData)
        }
    }
    
    private func convertDescription(
        from weatherID: Int
    ) -> String {
        let rain = (200...599)
        let snow = (600...699)
        let overcast = (700...799)
        let cloudy = (801...899)
        let clear = 800

        let weatherType: WeatherType = {
            if rain.contains(weatherID) {
                return WeatherType.rain
            } else if snow.contains(weatherID) {
                return WeatherType.rain
            } else if overcast.contains(weatherID) {
                return WeatherType.overcast
            } else if cloudy.contains(weatherID) {
                return WeatherType.cloudy
            } else if clear == weatherID {
                return WeatherType.clear
            } else {
                return WeatherType.unknown
            }
        }()
        return weatherType.description()
    }
}
