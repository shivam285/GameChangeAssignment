//
//  FireBaseIssueCommentsRequest.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct FireBaseIssueCommentsRequest: APIRequest {
    
    var baseURL: URL {
        return URL(string: Config.gitBaseURL)!
    }
    
    var path: String
    
    var method: HTTPMethod{
        return .get
    }
    
    var body: RequestBody{
        return [:]
    }
    
    var headers: RequestHeaders{
        return [:]
    }
    
    var parameters: RequestParams{
        return [:]
    }
    
    typealias APIResourceType = FireBaseIssueCommentsResource
    
    init(issueNumber: Int) {
        path = "/issues/\(issueNumber)/comments"
    }
    
}

final class FireBaseIssueCommentsResource: APIResource {
    
    var commentsJSONArray: [JSON]? {
        guard let dataJSONArray = raw as? [JSON] else { return nil }
        print(dataJSONArray)
        return dataJSONArray
    }
}
