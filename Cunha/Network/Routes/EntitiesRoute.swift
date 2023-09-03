//
//  EntitiesRoute.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation
enum EntitiesRoute:Service {
    case entity(search: String)
    var baseURL: String {
        return Endpoints.baseURL
    }
    var path: String {
        switch self {
        case .entity:
            return Endpoints.tickers
        }
    }
    var parameters: RequestParams {
        switch self {
        case .entity(let search):
            return.url(["access_key":Endpoints.apikey,"search":search])
        }
    }
    var method: HTTPMethod {
        switch self {
        case .entity:
            return .get
            
        }
    }
    var Header: [String : String] {
        return [:]
    }
}
