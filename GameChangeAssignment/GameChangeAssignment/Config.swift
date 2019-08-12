//
//  Config.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

struct Config {
    
    static let environment: Environment = .dev
    
    static var gitBaseURL: String {
        switch environment {
        case .dev:
            return "https://api.github.com/repos/firebase/firebase-ios-sdk"
        case .stage:
            return "https://api.github.com/repos/firebase/firebase-ios-sdk"
        case .production:
            return "https://api.github.com/repos/firebase/firebase-ios-sdk"
        }
    }
}
