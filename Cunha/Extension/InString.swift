//
//  InString.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier:"en_US_POSIX")
        dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let fullDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateWithoutTime = dateFormatter.string(from: fullDate!)
        return dateFormatter.date(from: dateWithoutTime)
    }
}

