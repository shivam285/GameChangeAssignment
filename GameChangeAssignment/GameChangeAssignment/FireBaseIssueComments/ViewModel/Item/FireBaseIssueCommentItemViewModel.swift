//
//  FireBaseIssueCommentsItemViewModel.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

class FireBaseIssueCommentItemViewModel: NSObject {
    
    //MARKL: -Properties
    var comment:GitIssueComment!
    
    //MARK: - Initialization methods
    init(comment:GitIssueComment) {
        self.comment = comment
    }
    
    //MARK: - Computed Property
    var commentBody:String{
        return comment.body ?? ""
    }
    
    var authorName:String {
        return comment.user?.login ?? ""
    }
}
