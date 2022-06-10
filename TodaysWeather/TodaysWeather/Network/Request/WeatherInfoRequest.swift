//
//  WeatherInfoRequest.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

struct WeatherInfoRequest: APIRequest {
    typealias ResponseType = WeatherInfo
        
    let geoInfoOfCity: GeoInfo
 
    var url: URL? {
        URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(geoInfoOfCity.latitude)&lon=\(geoInfoOfCity.longitude)&appid=\(Bundle.main.openWeatherAPIKey)")
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}
