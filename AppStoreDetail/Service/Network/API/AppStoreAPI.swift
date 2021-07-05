//
//  AppStoreAPI.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation
import Alamofire

enum AppStoreAPI {
    case lookup(Int)
}

extension AppStoreAPI {
    
    // base url
    var baseURL: String {
        return "http://itunes.apple.com"
    }
    
    // path
    var path: String {
        
        switch self {
        case let .lookup(id):
            return "\(baseURL)/lookup?id=\(id)"
        }
    }
    
    // method
    var method: HTTPMethod {
        switch self {
        case .lookup:
            return .get
        }
    }
    
    // headers
    var headers: [String: String]? {
        var headers: [String: String] = [:]
        return headers
    }
    
    // paramaters
    var paramaters: [String: Any] {
        switch self {
        default: return [:]
        }
    }
}
