//
//  MainError.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
enum MainError: String, Error {
    case noDataFound
    case emptyEntityTime
    case wrongTimeIntervals
    var localizedDescription: String {
        switch self {
        case .noDataFound: return "No data found on server, try another entity"
        case .emptyEntityTime: return "No Time Intervals to be presented on the charts at the moment"
        case .wrongTimeIntervals: return "Please make sure start date to be smaller than end date"
        }
    }
}
