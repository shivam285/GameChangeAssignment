//
//  GitLabel.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct GitLabel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case url = "url"
        case name = "name"
        case color = "color"
    }
    
    var id:Int?
    var nodeID:String?
    var url:String?
    var name:String?
    var color:String?
    
    static func instance(fromJSON json: [String: Any]) -> GitLabel? {
        
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
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        nodeID = try? values.decodeIfPresent(String.self, forKey: .nodeID)
        url = try? values.decodeIfPresent(String.self, forKey: .url)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        color = try? values.decodeIfPresent(String.self, forKey: .color)
        
    }
}
