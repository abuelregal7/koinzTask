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
    case login(phone: String?, type_id: Int?)
    case code(phone: String, password: String, type_id: Int)
    case home(lat: Double?, long: Double?)
    case allSubProduct(lat: Double?, long: Double?, id: Int?)
    case pages(id: Int?)
    case showCategories(storeId: Int?, categoryId: Int?)
    case product(id: Int?)
    case favourite
    case updateProfile(name: String?, gender: String?, email: String?, birthDay: String?)
    case getCart
    case addProductFavourite(productId: Int?)
    case removeProductFavourite(productId: Int?)
    case myOrders
    case offers(lat: Double?, long: Double?)
    case changeQuantity(itemId: Int?, type: Int?)
    case addOrder(orderId: String?, kindId: String?, finalDate: String?, distance: String?, duration: String?, paymentType: String?, details: String?, coupon: String?, fromLat: String?, fromLong: String?, fromTitle: String?, fromDescription: String?, toLat: String?, toLong: String?, toTitle: String?, toDescription: String?, phone: String?)
    case orderStatus(orderId: Int?)
    case cancelOrder(orderId: String?, statusId: String?, reason: String?)
    case categorySearch(lat: String?, long: String?, category_id: String?, search: String?)
    case profile
    case addresses
    case addAddress(lat: String?, long: String?, title: String?, description: String?)
    case updateAddress(addressId: String?, lat: String?, long: String?, title: String?, description: String?)
    case removeAddress(addressId: String?)
    case defualtAddress(addressId: String?)
    case coupon(coupon: String?)
    case updatePhone(phone: String?)
    case updatePhoneCheck(phone: String?, verification_code: String?)
    case updateFCMToken(device_token: String?, device_type: String?)
    
  // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
    //specify the type of HTTP request
    var httpMethod: HTTPMethodCombine {
        switch self {
        case .login:
            return .POST
        case .code:
            return .POST
        case .home:
            return .POST
        case .allSubProduct:
            return .POST
        case .pages:
            return .GET
        case .showCategories:
            return .POST
        case .product:
            return .POST
        case .favourite:
            return .POST
        case .updateProfile:
            return .POST
        case .getCart:
            return .POST
        case .addProductFavourite:
            return .POST
        case .removeProductFavourite:
            return .POST
        case .myOrders:
            return .POST
        case .offers:
            return .POST
        case .changeQuantity:
            return .POST
        case .addOrder:
            return .POST
        case .orderStatus:
            return .POST
        case .cancelOrder:
            return .POST
        case .categorySearch:
            return .POST
        case .profile:
            return .POST
        case .addresses:
            return .POST
        case .addAddress:
            return .POST
        case .removeAddress:
            return .POST
        case .updateAddress:
            return .POST
        case .defualtAddress:
            return .POST
        case .coupon:
            return .POST
        case .updatePhone:
            return .POST
        case .updatePhoneCheck:
            return .POST
        case .updateFCMToken:
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
    
    func login(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func code(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func home(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func allSubProduct(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func pages(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .GET)
    }
    
    func showCategories(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func product(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func favourite(token: String?, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func updateProfile(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func getCart(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func addProductFavourite(token: String?, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func removeProductFavourite(token: String?, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func myOrders(token: String?, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func offers(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func changeQuantity(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func addOrder(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func orderStatus(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func cancelOrder(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func categorySearch(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func profile(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func addresses(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func addAddresses(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func updateAddresses(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func removeAddresses(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func defualtAddresses(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func coupon(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func updatePhone(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func updatePhoneCheck(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    func updateFCMToken(environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"]     = "application/json"
        headers["Accept"]           = "application/json"
        headers["Accept-Language"]  = AppLocalization.currentAppleLanguage()
        headers["Authorization"]    = "Bearer \(VerificationCodeModel.currentUser?.token ?? "")"
        
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: .POST)
    }
    
    // encodable request body for POST
    var requestBody: Encodable? { //Encodable? //Parameter
        switch self {
        case .login(let phone, let type_id):
            return ["phone": phone, "type_id": "\(type_id)"]
        //default:
            //return nil
        case .code(let phone, let password, let type_id):
            return ["phone": phone, "password": password, "type_id": "\(type_id)"]
        case .home(let lat, let long):
            return ["lat": lat, "long": long]
        case .allSubProduct(let lat, let long, _):
            return ["lat": lat, "long": long]
        case.pages:
            return nil
        case .showCategories(let storeId, let categoryId):
            return ["store_id": storeId, "category_id": categoryId]
        case .product:
            return nil
        case .favourite:
            return nil
        case .updateProfile(let name, let gender, let email, let birthDay):
        return ["name": name, "gender": gender, "email": email, "birthday": birthDay]
        case .getCart:
            return nil
        case .addProductFavourite(let productId):
            return ["product_id" : productId]
        case .removeProductFavourite(let productId):
            return ["product_id" : productId]
        case .myOrders:
            return nil
        case .offers(let lat, let long):
            return ["lat":lat ,"long":long]
        case .changeQuantity(let itemId, let type):
            return ["item_id":itemId, "type": type]
        case .addOrder(let orderId, let kindId, let finalDate, let distance, let duration, let paymentType, let details, let coupon, let fromLat, let fromLong, let fromTitle, let fromDescription, let toLat, let toLong, let toTitle, let toDescription, let phone):
            return [
                "order_id":orderId,
                "kind_id":kindId,
                "date":finalDate,
                "distance":distance,
                "duration":duration,
                "payment_type":paymentType,
                "details":details,
                "coupon":coupon,
                "from_lat":fromLat,
                "from_long":fromLong,
                "from_title":fromTitle,
                "from_description":fromDescription,
                "to_lat":toLat,
                "to_long":toLong,
                "to_title":toTitle,
                "to_description":toDescription,
                "phone": phone
            ]
        case .orderStatus(let orderId):
            return ["order_id": orderId]
        case .cancelOrder(let orderId, let statusId, let reason):
            return ["order_id": orderId, "status_id": statusId, "reason": reason]
        case .categorySearch(let lat, let long, let category_id, let search):
            return ["lat": lat, "long": long, "category_id": category_id, "search": search]
        case .profile:
            return nil
        case .addresses:
            return nil
        case .addAddress(let lat, let long, let title, let description):
            return ["lat": lat, "long": long, "title": title, "description": description]
        case .updateAddress(let addressId, let lat, let long, let title, let description):
            return ["address_id" :addressId, "lat": lat, "long": long, "title": title, "description": description]
        case .removeAddress(let addressId):
            return ["address_id" :addressId]
        case .defualtAddress(let addressId):
            return ["address_id" :addressId]
        case .coupon(let coupon):
            return ["coupon" : coupon]
        case .updatePhone(let phone):
            return ["phone" : phone]
        case .updatePhoneCheck(let phone, let verification_code):
            return ["phone": phone, "verification_code": verification_code]
        case .updateFCMToken(let device_token, let device_type):
            return ["device_token": device_token, "device_type": device_type]
        }
    }
    
    // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.purchaseServiceBaseUrl
        switch self {
        
        case .login:
            return "\(baseUrl)api/login_phone"
        case .code:
            return "\(baseUrl)api/login"
        case .home:
            return "\(baseUrl)api/home"
        case .allSubProduct(_, _, let id):
            return "\(baseUrl)api/stores/\(id ?? 0)"
        case.pages(let id):
            return "\(baseUrl)api/pages/\(id ?? 0)"
        case.showCategories:
            return "\(baseUrl)api/stores_category"
        case .product(let id):
            return "\(baseUrl)api/products/\(id ?? 0)"
        case .favourite:
            return "\(baseUrl)api/favorites"
        case .updateProfile:
            return "\(baseUrl)api/update"
        case .getCart:
            return "\(baseUrl)api/cart"
        case .addProductFavourite:
            return "\(baseUrl)api/favorites/add"
        case .removeProductFavourite:
            return "\(baseUrl)api/favorites/remove"
        case .myOrders:
            return "\(baseUrl)api/my_orders"
        case .offers:
            return "\(baseUrl)api/discounts"
        case .changeQuantity:
            return "\(baseUrl)api/cart/change"
        case .addOrder:
            return "\(baseUrl)api/orders/add"
        case .orderStatus:
            return "\(baseUrl)api/orders/tracking"
        case .cancelOrder:
            return "\(baseUrl)api/orders/status"
        case .categorySearch:
            return "\(baseUrl)api/stores"
        case .profile:
            return "\(baseUrl)api/profile"
        case .addresses:
            return "\(baseUrl)api/addressese"
        case .addAddress:
            return "\(baseUrl)api/addresses/add"
        case .updateAddress:
            return "\(baseUrl)api/addresses/update"
        case .removeAddress:
            return "\(baseUrl)api/addresses/remove"
        case .defualtAddress:
            return "\(baseUrl)api/addresses/current"
        case .coupon:
            return "\(baseUrl)api/orders/coupon"
        case .updatePhone:
            return "\(baseUrl)api/update_phone"
        case .updatePhoneCheck:
            return "\(baseUrl)api/update_phone_check"
        case .updateFCMToken:
            return "\(baseUrl)api/update_device_token"
        }
    }
}
