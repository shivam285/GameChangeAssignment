//
//  APIRequest.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

typealias RequestParams = [String: Any]
typealias RequestHeaders = [String: String]
typealias RequestBody = [String: Any]

protocol APIRequest {
    
    associatedtype APIResourceType: APIResource

    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var body: RequestBody { get }
    
    var headers: RequestHeaders { get }
    
    var parameters: RequestParams { get }
    
    func asURLRequest() throws -> URLRequest
    
    var encoding: ParameterEncoder { get}
    
}

extension APIRequest {
    
    var encoding: ParameterEncoder {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = try URLRequest(url: url, method: method, headers: headers)
        urlRequest = try encoding.encode(urlRequest: urlRequest, with: parameters)
        return urlRequest
    }
}
