//
//  ServiceEndpoints.swift
//  combineApp
//
//  Created by Ahmed on 1/15/22.
//

import Foundation

public typealias Headers = [String: String]
public typealias Parameter = [String: Any]

// if you wish you can have multiple services like this in a project
enum PurchaseServiceEndpoints {
    
  // organise all the end points here for clarity
    case photos(page: Int?, perPage: Int?)
    
  // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
    //specify the type of HTTP request
    var httpMethod: HTTPMethodCombine {
        switch self {
        case .photos:
            return .POST
        }
    }
    
  // compose the NetworkRequest
    
//    func createRequest(token: String, environment: Environment) -> NetworkRequest {
//        var headers: Headers = [:]
//        headers["Content-Type"] = "application/json"
//        headers["Authorization"] = "Bearer \(token)"
//        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
//    }
    
    func photos(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    // encodable request body for POST
    var requestBody: Encodable? { //Encodable? //Parameter
        switch self {
        case .photos:
            return nil
        }
    }
    
    // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.purchaseServiceBaseUrl
        switch self {
        
        case .photos(let page, let perPage):
            return "\(baseUrl)page=\(page ?? 1)&per_page=20&api_key=d17378e37e555ebef55ab86c4180e8dc"
        }
        
    }
    
}
