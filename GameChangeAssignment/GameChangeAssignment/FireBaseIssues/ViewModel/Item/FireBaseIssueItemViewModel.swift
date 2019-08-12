//
//  FireBaseIssueItemViewModel.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

class FireBaseIssueItemViewModel: NSObject {
    
    //MARK: - Properties
    var issue:GitRepoIssue!
    
    //MARK: - Initialization methods
    init(issue:GitRepoIssue) {
        self.issue = issue
    }
    
    //MARK: - Computed Properties
    var issueTitle : String {
        return issue.title ?? ""
    }
    
    var updatedAt: String {
        return issue.updatedAt ?? ""
    }
    
    var isCommentsAvailable: Bool {
        if let commentsCount = issue.comments, commentsCount > 0 {
            return true
        }
        return false
    }
    
}
