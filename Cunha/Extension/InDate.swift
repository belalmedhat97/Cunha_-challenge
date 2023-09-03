//
//  InDate.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier:"en_US_POSIX")
        dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return  dateFormatter.string(from: self)

    }
}
