//
//  TickersRoute.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation
enum TickersRoute:Service {
    case tickers(search: String)
    var baseURL: String {
        return Endpoints.baseURL
    }
    var path: String {
        switch self {
        case .tickers:
            return Endpoints.tickers
        }
    }
    var parameters: RequestParams {
        switch self {
        case .tickers(let search):
            return.url(["access_key":Endpoints.apikey,"search":search])
        }
    }
    var method: HTTPMethod {
        switch self {
        case .tickers:
            return .get
            
        }
    }
    var Header: [String : String] {
        return [:]
    }
}
