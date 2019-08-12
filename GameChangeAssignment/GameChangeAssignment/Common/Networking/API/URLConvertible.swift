//
//  URLConvertible.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

protocol URLConvertible {
    func asURL() throws -> URL
}

extension URL: URLConvertible {
    func asURL() throws -> URL {
        return self
    }
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

extension URLRequest: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        return self
    }
}

extension URLRequest {
    
    init(url: URLConvertible, method: HTTPMethod, headers: RequestHeaders? = nil) throws {
        let url = try url.asURL()
        
        self.init(url: url)
        
        self.httpMethod = method.rawValue
        allHTTPHeaderFields = headers
    }
}
