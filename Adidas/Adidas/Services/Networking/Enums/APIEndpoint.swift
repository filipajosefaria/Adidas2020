//
//  APIEndpoint.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import Alamofire

class Connectivity {
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

enum APIEndpoint: URLRequestConvertible {
    case goals
    
    var method: HTTPMethod {
        switch self {
            case .goals:
                return .get
//            default:
//                return .post
        }
    }
    
    var path: String {
        switch self {
        case .goals:
            return "_ah/api/myApi/v1/goals"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = Constants.API.url

        let url: URL
        var urlRequest: URLRequest
        
        let stringUrl = urlString + path
        url = try stringUrl.asURL()
        urlRequest = URLRequest(url: url)
        

        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = TimeInterval(20)

        return urlRequest
    }
}
