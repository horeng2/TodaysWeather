//
//  URLSessionProvider.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/10.
//

import Foundation

class APIProvider {
    let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request<T: APIRequest>(
        requestType: T,
        completionHandler: @escaping (Result<T.ResponseType, NetworkError>) -> Void
    ) {
        guard let request = requestType.urlRequest else {
            return
        }
        
        let task = self.session.dataTask(with: request) { data, urlResponse, error in
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      return completionHandler(.failure(.responseError))
            }
            
            guard let data = data else {
                return completionHandler(.failure(.invaildData))
            }
            
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(T.ResponseType.self, from: data) else {
                return completionHandler(.failure(.parsingError))
            }
            completionHandler(.success(decodedData))

        }
        task.resume()
    }
}
