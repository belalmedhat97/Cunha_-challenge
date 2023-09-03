//
//  APIRequestManager.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation
protocol EntityRequestProtocol {
    func requestEntity(_ by: String) async -> (result:EntityModel?,error:Error?)
}

protocol EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, from: String, to: String) async -> (result:EntityTimeModel?,error:Error?)
}

class ApiRequestsManager: EntityRequestProtocol {
    
    private let network = ApiClient()
    func requestEntity(_ by: String) async -> (result:EntityModel?,error:Error?) {
        do {
            let result = try await network.Request(URL: EntitiesRoute.entity(search:by).urlRequest, responseModel: EntityModel())
            if result.error != nil {
                return (nil,result.error)
            }else{
                guard result.success != nil else {
                    let error = NSError(domain:"no city exist", code: 422, userInfo:nil)
                    return (nil,error)
                }
                return (result.success,nil)
            }
        }catch (let error) {
            return (nil,error)
        }
    }
}
extension ApiRequestsManager: EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, from: String, to: String) async -> (result: EntityTimeModel?, error: Error?) {
        do {
            let result = try await network.Request(URL: EndOfDayRoute.entityWithIntervels(symbol: symbol, from: from, to: to).urlRequest, responseModel: EntityTimeModel())
            if result.error != nil {
                return (nil,result.error)
            }else{
                guard result.success != nil else {
                    let error = NSError(domain:"no city exist", code: 422, userInfo:nil)
                    return (nil,error)
                }
                return (result.success,nil)
            }
        }catch (let error) {
            return (nil,error)
        }
    }
}


