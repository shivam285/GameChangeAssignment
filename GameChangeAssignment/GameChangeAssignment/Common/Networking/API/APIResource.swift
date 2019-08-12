//
//  APIResource.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

class APIResource {
    
    var raw: [[String: Any]]?
    
    required init(_ raw: [[String: Any]]?) {
        self.raw = raw
    }

}
