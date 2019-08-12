//
//  APIResponse.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

enum APIResponse<T: APIResource> {
    case resource(T)
    case error(APIError)
}
