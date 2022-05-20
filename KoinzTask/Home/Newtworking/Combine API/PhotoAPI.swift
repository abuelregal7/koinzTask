//
//  PhotoAPI.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import Foundation
import Combine
import Alamofire

protocol PhotoAPIProtocol {
    func photos(page: Int?, perPage: Int?) -> AnyPublisher<FlirkModel, NetworkErrror>
    
}

class PhotoAPI: PhotoAPIProtocol {
    
    private var networkRequest: Requestable
    private var environment: Environment = .production
    
    // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest  = networkRequest
        self.environment     = environment
        
    }
    
    func photos(page: Int?, perPage: Int?) -> AnyPublisher<FlirkModel, NetworkErrror> {
        // for make post request with param => param: [String: Any]
        let endpoint = PurchaseServiceEndpoints.photos(page: page, perPage: perPage)
        let request  = endpoint.photos(environment: self.environment)
        
        return self.networkRequest.request(request)
    }
    
}

protocol PhotoAlamofireAPIProtocol {
    func photos(completion: @escaping (Result<FlirkModel?, NetworkError>) -> Void)
}
class PhotoAlamofireAPI: PhotoAlamofireAPIProtocol {
    
    var page: Int?
    var perPage: Int?
//    var frame: Int?
//    var server: Int?
//    var id: Int?
//    var secret: Int?
    
    init(page: Int?, perPage: Int?) { //frame: Int?, server: Int?, id: Int?, secret: Int?,
        
//        self.frame = frame
//        self.server = server
//        self.id = id
//        self.secret = secret
        self.page = page
        self.perPage = perPage
        
    }
    
    func photos(completion: @escaping (Result<FlirkModel?, NetworkError>) -> Void) {
        
        let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=50&text=Color&page=\(page ?? 1)&per_page=20&api_key=d17378e37e555ebef55ab86c4180e8dc"
        
        let headers: HTTPHeaders = [
            "Content-Type":"application/json",
            "Accept":"application/json",
            "Accept-Language":AppLocalization.currentAppleLanguage()
        ]
        
        APISERVICE.instance.ParseData(url: url, methodType: .post, parameters: nil, headers: headers) { (result) in
            completion(result)
        }
    }
    
}
