//
//  AppDependency.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation
import Alamofire

struct AppDependency {
    static let apiManager = APIManager(sessionManager: Session.default)
}
