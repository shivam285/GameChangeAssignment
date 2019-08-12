//
//  GitIssueComment.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct GitIssueComment:Decodable {
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case htmlURL = "html_url"
        case id = "id"
        case nodeID = "node_id"
        case user = "user"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authorAssociation = "author_association"
        case body = "body"
        case issueURL = "issue_url"
    }
    
    var url:String?
    var htmlURL:String?
    var id:Int?
    var nodeID:String?
    var user:GitUser?
    var createdAt:String?
    var updatedAt:String?
    var authorAssociation:String?
    var body:String?
    var issueURL:String?

    static func instance(fromJSON json: [String: Any]) -> GitIssueComment? {
        
        let decoder = JSONDecoder()
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let result = try decoder.decode(self, from: data)
            return result
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID)
        user = try? values.decodeIfPresent(GitUser.self, forKey: .user)
        createdAt = try? values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try? values.decodeIfPresent(String.self, forKey: .updatedAt)
        authorAssociation = try? values.decodeIfPresent(String.self, forKey: .authorAssociation)
        body = try? values.decodeIfPresent(String.self, forKey: .body)
        issueURL = try? values.decodeIfPresent(String.self, forKey: .issueURL)
    }
    
}

