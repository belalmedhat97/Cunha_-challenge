//
//  URLConfigurator.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}
enum RequestParams {
    case body(_:[String:Any])
    case url(_:[String:Any])
    case NoParamter
}
protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: RequestParams { get }
    var method: HTTPMethod { get }
    var Header:[String:String] { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = URL(string: baseURL) else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = Header
        switch parameters {
        case .body(let params):
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            request.url = components?.url
        case .NoParamter:
            request.httpBody = nil
        }
        return request
    }
}
