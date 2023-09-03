//
//  NetworkMock.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
@testable import Cunha

class ApiRequestsManagerMock: EntityRequestProtocol, EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, from: String, to: String) async -> (result:EntityTimeModel?,error:Error?) {
        
        return (JsonReaderStub.shared.load(file: "EntitiesIntervalStub", model: EntityTimeModel()),nil)
    }
    
    func requestEntity(_ by: String) async -> (result:EntityModel?,error:Error?)
    {
        return (JsonReaderStub.shared.load(file: "EntitiesStub", model: EntityModel()),nil)
    }
}
class ApiRequestsManagerFailMock: EntityRequestProtocol, EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, from: String, to: String) async -> (result:EntityTimeModel?,error:Error?) {
        
        return (JsonReaderStub.shared.load(file: "EntitiesIntervalStub", model: EntityTimeModel()),NetworkError.noInternetConnection)
    }
    
    func requestEntity(_ by: String) async -> (result:EntityModel?,error:Error?)
    {
        return (JsonReaderStub.shared.load(file: "EntitiesStub", model: EntityModel()),NetworkError.jsonParsingFail)
    }
}
