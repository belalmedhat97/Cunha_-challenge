//
//  ErrorModel.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation

struct ErrorModel: Codable {
    var error: ErrorData?
}
struct ErrorData: Codable {
    var code: String?
    var message: String?
}
