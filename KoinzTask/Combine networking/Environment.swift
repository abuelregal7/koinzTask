//
//  Environment.swift
//  combineApp
//
//  Created by Ahmed on 1/15/22.
//

import Foundation

public enum Environment: String, CaseIterable {
    case development
    case staging
    case testing
    case production
}

extension Environment {
    var purchaseServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://jsonplaceholder.typicode.com/"
        case .staging:
            return "https://stg-combine.com/purchaseService"
        case .testing:
            return "https://jsonplaceholder.typicode.com/"
        case .production:
            return "https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=50&text=Color&"
            
            //https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=50&text=Color&page=1&per_page=20&api_key=d17378e37e555ebef55ab86c4180e8dc
        
        }
    }
}

/*
 case .development:
     return "https://dev-combine.com/purchaseService"
 case .staging:
     return "https://stg-combine.com/purchaseService"
 case .production:
     return "https://combine.com/purchaseService"
 case .test:
     return "https://jsonplaceholder.typicode.com/"
 }
 */
