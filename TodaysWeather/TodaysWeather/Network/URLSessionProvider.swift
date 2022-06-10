//
//  URLSessionProvider.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class URLSessionProvider {
    let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func dataTask(_ request: URLRequest, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, urlResponse, error in
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      return completionHandler(.failure(.responseError))
            }
            guard let data = data else {
                return completionHandler(.failure(.invaildData))
            }
            completionHandler(.success(data))
        }
        task.resume()
        return task
    }
}
