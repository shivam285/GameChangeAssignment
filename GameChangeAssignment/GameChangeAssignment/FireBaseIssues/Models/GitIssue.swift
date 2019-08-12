//
//  GitIssue.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct GitRepoIssue: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id = "id"
        case nodeID = "node_id"
        case number = "number"
        case title = "title"
        case user = "user"
        case labels = "labels"
        case state = "state"
        case locked = "locked"
        case comments = "comments"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authorAssociation = "author_association"
        case pullRequest = "pull_request"
        case body = "body"
    }
    
    var url: String?
    var repositoryURL:String?
    var labelsURL:String?
    var commentsURL:String?
    var eventsURL:String?
    var htmlURL:String?
    var id:Int?
    var nodeID:String?
    var number:Int?
    var title:String?
    var user:GitUser?
    var labels:[GitLabel]?
    var state:String?
    var locked:Bool?
    var comments:Int?
    var createdAt:String?
    var updatedAt:String?
    var authorAssociation:String?
    var pullRequest:GitPullRequest?
    var body:String?
    
    static func instance(fromJSON json: [String: Any]) -> GitRepoIssue? {
        
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
        repositoryURL = try? values.decodeIfPresent(String.self, forKey: .repositoryURL)
        labelsURL = try? values.decodeIfPresent(String.self, forKey: .labelsURL)
        commentsURL = try? values.decodeIfPresent(String.self, forKey: .commentsURL)
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL)
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID)
        number = try? values.decodeIfPresent(Int.self, forKey: .number)
        title = try? values.decodeIfPresent(String.self, forKey: .title)
        user = try? values.decodeIfPresent(GitUser.self, forKey: .user)
        locked = try? values.decodeIfPresent(Bool.self, forKey: .locked)
        comments = try? values.decodeIfPresent(Int.self, forKey: .comments)
        createdAt = try? values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try? values.decodeIfPresent(String.self, forKey: .updatedAt)
        authorAssociation = try? values.decodeIfPresent(String.self, forKey: .authorAssociation)
        pullRequest = try? values.decodeIfPresent(GitPullRequest.self, forKey: .pullRequest)
        body = try? values.decodeIfPresent(String.self, forKey: .body)
    }
}

struct GitPullRequest:Decodable {
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
    
    var url:String?
    var htmlURL:String?
    var diffURL:String?
    var patchURL:String?
    
    static func instance(fromJSON json: [String: Any]) -> GitPullRequest? {
        
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
        diffURL = try? values.decodeIfPresent(String.self, forKey: .diffURL)
        patchURL = try? values.decodeIfPresent(String.self, forKey: .patchURL)
    }
}
