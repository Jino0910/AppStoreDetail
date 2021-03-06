//
//  AFSessionManager.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import Foundation
import Alamofire

protocol AFSessionManagerProtocol {
    
    /// Closure which provides a `URLRequest` for mutation.
    typealias RequestModifier = (inout URLRequest) throws -> Void
    
    @discardableResult
    func request(_ convertible: URLConvertible,
                      method: HTTPMethod,
                      parameters: Parameters?,
                      encoding: ParameterEncoding,
                      headers: HTTPHeaders?,
                      interceptor: RequestInterceptor?,
                      requestModifier: RequestModifier?) -> DataRequest
}

extension Session: AFSessionManagerProtocol {
    
}
