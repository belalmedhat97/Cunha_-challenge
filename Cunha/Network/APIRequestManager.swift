//
//  APIRequestManager.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation
protocol TickersRequestProtocol {
    func requestTickers(_ by: String) async -> (result:TickersModel?,error:Error?)

}
class ApiRequestsManager: TickersRequestProtocol {
    
    private let network = ApiClient()
    func requestTickers(_ by: String) async -> (result:TickersModel?,error:Error?) {
        do {
            let result = try await network.Request(URL: TickersRoute.tickers(search:by).urlRequest, responseModel: TickersModel())
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


