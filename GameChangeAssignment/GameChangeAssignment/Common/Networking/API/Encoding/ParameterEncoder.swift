//
//  ParameterEncoder.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation
protocol ParameterEncoder {
    func encode(urlRequest: URLRequestConvertible, with parameters: RequestParams) throws -> URLRequest
}
