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
            return "https://ever-deliver.com/"
            
            //https://ever-deliver.moltaqa-wo.net/
            //http://b7fe-197-61-157-159.ngrok.io/
            //http://10.0.0.251/laravel/ever-deliver/public/
            //https://ever-deliver.com/
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
