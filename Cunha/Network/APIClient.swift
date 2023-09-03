//
//  APIClient.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation

class ApiClient {
    func Request<T:Codable,S:Codable>(URL:URLRequest, responseModel:T,errorModel:S) async throws -> (success:T?,badRequest:S?,error:NetworkError?){
        let session = URLSession.shared
        let (data,response) = try await session.data(for: URL)
        if let HTTPResponse = response as? HTTPURLResponse {
            switch HTTPResponse.statusCode {
            case 200..<300:
                do{
                    let responseDecoded = try JSONDecoder().decode(T.self, from: data)
                    return (responseDecoded,nil,nil)
                } catch  {
                    return(nil,nil,.jsonParsingFail)
                }
            case 400...500:
                do{
                    let responseErrorDecoded = try JSONDecoder().decode(S.self, from: data)
                    return (nil,responseErrorDecoded,nil)
                } catch  {
                    return(nil,nil,.jsonParsingFail)
                }
            default:
                return (nil,nil,.responseUnsuccessful)
            }
        }
        return (nil,nil,nil)
    }
}
