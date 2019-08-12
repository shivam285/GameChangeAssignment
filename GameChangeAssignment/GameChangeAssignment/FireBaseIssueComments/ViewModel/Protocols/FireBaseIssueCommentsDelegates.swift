//
//  FireBaseIssueCommentsDelegates.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

protocol FireBaseIssueCommentsViewDelegate:class {
    
    func freBaseIssueCommentsViewModel(_ viewModel:FireBaseIssueCommentsViewModel, fetchedIssueComments itemViewModels: [FireBaseIssueCommentItemViewModel])
    
    func freBaseIssueCommentsViewModel(_ viewModel:FireBaseIssueCommentsViewModel, failedToFetchComments error: Error)

}
