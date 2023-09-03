//
//  EntityIntervalsModel.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
struct EntityTimeModel: Codable, Hashable {
    var pagination: Pagination?
    var data: [EntityTimeData]?
}
struct EntityTimeData: Codable, Hashable {
    var open: Double?
    var high: Double?
    var low: Double?
    var close: Double?
    var volume: Double?
    var adj_high: Double?
    var adj_low: Double?
    var adj_close: Double?
    var adj_open: Double?
    var adj_volume: Double?
    var split_factor: Double?
    var dividend: Double?
    var symbol: String?
    var exchange: String?
    var date: String?
}
