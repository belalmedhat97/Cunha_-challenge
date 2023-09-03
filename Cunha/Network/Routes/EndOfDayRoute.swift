//
//  EndOfDayRoute.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
enum EndOfDayRoute:Service {
    case entityWithIntervels(symbol:String, from:String, to:String)
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
        case .entityWithIntervels(let symbol, let from, let to):
            return.url(["access_key":Endpoints.apikey,"symbols":symbol,"date_from":from, "date_to":to,"limit":20])
        }
    }
    var method: HTTPMethod {
        switch self {
        case .entityWithIntervels:
            return .get
            
        }
    }
    var Header: [String : String] {
        return [:]
    }
}
