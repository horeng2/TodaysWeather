//
//  City.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import Foundation

enum City: String, CaseIterable, Decodable {
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
    
    func koreanName() -> String{
        switch self {
        case .Gongju:
            return "공주"
        case .Gwangju:
            return "광주"
        case .Gumi:
            return "구미"
        case .Gunsan:
            return "군산"
        case .Daegu:
            return "대구"
        case .Daejeon:
            return "대전"
        case .Mokpo:
            return "목포"
        case .Busan:
            return "부산"
        case .Seosan:
            return "서산"
        case .Seoul:
            return "서울"
        case .Sokcho:
            return "속초"
        case .Suwon:
            return "수원"
        case .Suncheon:
            return "순천"
        case .Ulsan:
            return "울산"
        case .Iksan:
            return "익산"
        case .Jeonju:
            return "전주"
        case .jeju:
            return "제주"
        case .Cheonan:
            return "천안"
        case .Cheongju:
            return "청주"
        case .Chuncheon:
            return "춘천"
        }
    }
}
