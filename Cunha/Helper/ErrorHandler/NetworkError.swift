//
//  ErrorHandler.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
enum NetworkError: String, Error {
    case noInternetConnection
    case jsonParsingFail
    case responseUnsuccessful
    
    var localizedDescription: String {
        switch self {
        case .noInternetConnection: return "Please Check Your Internet Connection"
        case .jsonParsingFail: return "Json Parsing Fail"
        case .responseUnsuccessful: return "Response was Unsuccessful"
        }
    }
}
