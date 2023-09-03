//
//  TickersModel.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation

struct EntityModel: Codable, Hashable {
    var pagination: Pagination?
    var data: [EntityData]?
}

struct EntityData: Codable, Hashable {
    var name: String?
    var symbol: String?
    var has_intraday: Bool?
    var has_eod: Bool?
    var country: String?
    var stock_exchange: StockExchange?
}

struct StockExchange: Codable, Hashable {
    var name: String?
    var acronym: String?
    var mic: String?
    var country: String?
    var countryCode: String?
    var city: String?
    var website: String?
}

struct Pagination: Codable, Hashable {
    var limit: Int?
    var offset: Int?
    var count: Int?
    var total: Int?
}
