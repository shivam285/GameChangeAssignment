//
//  GitUser.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct GitUser: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
        case followingURL = "following_url"

    }
    
    var login: String?
    var id: String?
    var nodeId: String?
    var avatarURL: String?
    var gravatarID: String?
    var url: String?
    var htmlURL: String?
    var followersURL:String?
    var followingURL:String?
    var gistsURL: String?
    var starredURL:String?
    var subscriptionsURL:String?
    var organizationsURL:String?
    var reposURL:String?
    var eventsURL:String?
    var receivedEventsURL:String?
    var type:String?
    var siteAdmin:Bool?
    
    static func instance(fromJSON json: [String: Any]) -> GitUser? {
        
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
        login = try? values.decodeIfPresent(String.self, forKey: .login)
        id = try? values.decodeIfPresent(String.self, forKey: .id)
        nodeId = try? values.decodeIfPresent(String.self, forKey: .nodeId)
        avatarURL = try? values.decodeIfPresent(String.self, forKey: .avatarURL)
        gravatarID = try? values.decodeIfPresent(String.self, forKey: .gravatarID)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
        htmlURL = try? values.decodeIfPresent(String.self, forKey: .htmlURL)
        followersURL = try? values.decodeIfPresent(String.self, forKey: .followersURL)
        followingURL = try? values.decodeIfPresent(String.self, forKey: .followingURL)
        gistsURL = try? values.decodeIfPresent(String.self, forKey: .gistsURL)
        starredURL = try? values.decodeIfPresent(String.self, forKey: .starredURL)
        subscriptionsURL = try? values.decodeIfPresent(String.self, forKey: .subscriptionsURL)
        organizationsURL = try? values.decodeIfPresent(String.self, forKey: .organizationsURL)
        reposURL = try? values.decodeIfPresent(String.self, forKey: .reposURL)
        eventsURL = try? values.decodeIfPresent(String.self, forKey: .eventsURL)
        type = try? values.decodeIfPresent(String.self, forKey: .type)
        receivedEventsURL = try? values.decodeIfPresent(String.self, forKey: .receivedEventsURL)
        siteAdmin = try? values.decodeIfPresent(Bool.self, forKey: .siteAdmin)

    
    }
    
}
