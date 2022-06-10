//
//  Repository.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/11.
//

import Foundation

protocol Repository {
    associatedtype ResponseType
    
    var apiProvider: APIProvider { get }
    func fetchInfo(of city: City, completionHandler: @escaping (Result<ResponseType, NetworkError>) -> Void)}
