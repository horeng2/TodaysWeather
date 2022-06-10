//
//  WeatherInfoRequest.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

struct WeatherInfoRequest: APIRequest {
    typealias ResponseType = TodaysWeather
        
    let city: City
 
    var url: URL? {
        URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(city.geoInfo().latitude)&lon=\(city.geoInfo().longitude)&appid={API key}")
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}
