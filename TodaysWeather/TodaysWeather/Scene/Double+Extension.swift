//
//  Double+Extension.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import Foundation

extension Double {
    func roundToInt() -> Int {
        return Int(self.rounded())
    }
}
