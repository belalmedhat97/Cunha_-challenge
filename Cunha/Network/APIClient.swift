//
//  APIClient.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation

class ApiClient {
    func Request<T:Codable>(URL:URLRequest, responseModel:T) async throws -> (success:T?,error:Error?){
        let session = URLSession.shared
        let (data,response) = try await session.data(for: URL)
        if let HTTPResponse = response as? HTTPURLResponse {
            switch HTTPResponse.statusCode {
            case 200..<300:
                do{
                    let responseDecoded = try JSONDecoder().decode(T.self, from: data)
                    return (responseDecoded,nil)
                } catch let error {
                    print(error)
                    return(nil,error)
                }
            case 400...500:
                return (nil,getError(code: HTTPResponse.statusCode, description: response.debugDescription))
            default:
                return (nil,getError(code: HTTPResponse.statusCode, description: response.debugDescription))
            }
        }
        return (nil,nil)
    }
    
    private func getError(code:Int, description:String) -> Error {
        return NSError(domain:description, code:code, userInfo:nil)
    }
}
