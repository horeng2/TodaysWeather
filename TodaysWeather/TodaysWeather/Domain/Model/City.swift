//
//  City.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

enum City: CaseIterable, Decodable {
    case Gongju
    case Gwangju
    case Gumi
    case Gunsan
    case Daegu
    case Daejeon
    case Mokpo
    case Busan
    case Seosan
    case Seoul
    case Sokcho
    case Suwon
    case Suncheon
    case Ulsan
    case Iksan
    case Jeonju
    case jeju
    case Cheonan
    case Cheongju
    case Chuncheon
    
    func localizedName() -> String{
        return "\(self)".localized
    }
}
