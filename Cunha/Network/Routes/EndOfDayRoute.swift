//
//  EndOfDayRoute.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
enum EndOfDayRoute: Service {
    case entityWithIntervels(symbol: String, fromDate: String, toDate: String)
    var baseURL: String {
        return Endpoints.baseURL
    }
    var path: String {
        switch self {
        case .entityWithIntervels:
            return Endpoints.eod
        }
    }
    var parameters: RequestParams {
        switch self {
        case .entityWithIntervels(let symbol, let fromDate, let toDate):
            return.url(["access_key": Endpoints.apikey,
                        "symbols": symbol, "date_from": fromDate,
                        "date_to": toDate, "limit": 100])
        }
    }
    var method: HTTPMethod {
        switch self {
        case .entityWithIntervels:
            return .get
        }
    }
    var header: [String: String] {
        return [:]
    }
}
