//
//  APIRequestManager.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation
protocol EntityRequestProtocol {
    func requestEntity(_ with: String) async -> (result: EntityModel?, error: Error?)
}

protocol EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, fromDate: String, toDate: String) async
    -> (result: EntityTimeModel?, error: Error?)
}

class ApiRequestsManager {
    private let network = ApiClient()
    private func setupError(code:Int, description:String) -> Error {
        return NSError(domain:description, code: code, userInfo:nil)
    }
}

extension ApiRequestsManager: EntityRequestProtocol {
    func requestEntity(_ with: String) async -> (result:EntityModel?,error:Error?) {
        do {
            let result = try await
            network.request(URL: EntitiesRoute.entity(search:with).urlRequest,
                            responseModel: EntityModel(),
                            errorModel: ErrorModel())
            guard result.badRequest == nil else {
                return (nil,setupError(code: 422, description: result.badRequest?.error?.message ?? "")) }
            guard result.error == nil else {
                return (nil,result.error) }
            return (result.success,nil)
        } catch {
            return (nil,setupError(code: -1009,
                                   description: NetworkError.noInternetConnection.localizedDescription))
        }
    }
}

extension ApiRequestsManager: EntityTimesRequestProtcols {
    func requestEntityBetweenIntervals(_ symbol: String, fromDate: String, toDate: String) async
    -> (result: EntityTimeModel?, error: Error?) {
        do {
            let result = try await
            network.request(URL:
            EndOfDayRoute.entityWithIntervels(symbol: symbol,fromDate: fromDate,
            toDate: toDate).urlRequest,responseModel: EntityTimeModel(),
            errorModel: ErrorModel())
            guard result.badRequest == nil else {
                return (nil,setupError(code: 422, description: result.badRequest?.error?.message ?? "")) }
            guard result.error == nil else { return (nil,result.error) }
            return (result.success,nil)
        } catch {
            return (nil,setupError(code: -1009,
                                   description: NetworkError.noInternetConnection.localizedDescription))
        }
    }
}
