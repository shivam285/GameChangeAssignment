//
//  FireBaseIssuesReuest.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation
typealias JSON = [String:Any]

struct FireBaseIssuesReuest: APIRequest {
    
    var baseURL: URL {
        return URL(string:Config.gitBaseURL)!
    }
    
    var path: String {
        return "/issues"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var body: RequestBody {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var parameters: RequestParams {
        return [:]
    }
    
    typealias APIResourceType = FireBaseIssuesResource
    
    
}


final class FireBaseIssuesResource:APIResource {
    
    var fireBaseIssuesJSONArray: [JSON]? {
        guard let dataJSONArray = raw as? [JSON] else { return nil }
        print(dataJSONArray)
        return dataJSONArray
    }
    
}
