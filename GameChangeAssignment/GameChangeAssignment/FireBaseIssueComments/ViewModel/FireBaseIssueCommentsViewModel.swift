//
//  FireBaseIssueCommentsViewModel.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

struct FireBaseIssueCommentsViewModelInitParams{
    var issue:GitRepoIssue!
}

class FireBaseIssueCommentsViewModel: NSObject {
    
    //MARK: - PRoperties
    var issue:GitRepoIssue!
    weak var viewDelegate:FireBaseIssueCommentsViewDelegate?
    var commentItemViewModels: [FireBaseIssueCommentItemViewModel]?
    
    //MARK: - Computed Properties
    var navBarTitle: String {
        return "Comments"
    }
    
    //MARKL: - Initialization methods
    init(params:FireBaseIssueCommentsViewModelInitParams) {
        self.issue = params.issue
    }
}

//MARK: - Methods
extension FireBaseIssueCommentsViewModel {
    
    func populateIssueCommentsItemViewModels(JSONArray: [JSON]) {
        
        if commentItemViewModels == nil {
            commentItemViewModels = [FireBaseIssueCommentItemViewModel]()
        }
        
        for eachItem in JSONArray{
            if let issueComment = GitIssueComment.instance(fromJSON: eachItem) {
                let itemViewModel = FireBaseIssueCommentItemViewModel(comment: issueComment)
                self.commentItemViewModels?.append(itemViewModel)
            }
        }
        
    }
    
    func getItemViewModel(atIndexPath indexPath: IndexPath) ->FireBaseIssueCommentItemViewModel {
        return commentItemViewModels![indexPath.row]
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FireBaseIssueCommentsViewModel {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentItemViewModels?.count ?? 0
    }
    
}

//MARK: - API and Service call methods
extension FireBaseIssueCommentsViewModel {
    
    func fetchIssueComments() {
        
        guard let issueNumber = issue.number else { return }
        
        let request = FireBaseIssueCommentsRequest(issueNumber: issueNumber)
        
        API.fetch(request: request) { [weak self] (response) -> (Void) in
            
            guard let _WeakSelf = self else { return }
            
            switch response {
                
            case .resource(let resoure):
                if let commentsJSONArray = resoure.commentsJSONArray {
                    _WeakSelf.populateIssueCommentsItemViewModels(JSONArray: commentsJSONArray)
                }
                _WeakSelf.viewDelegate?.freBaseIssueCommentsViewModel(_WeakSelf, fetchedIssueComments: _WeakSelf.commentItemViewModels!)
                break
            
            case .error(let error):
                _WeakSelf.viewDelegate?.freBaseIssueCommentsViewModel(_WeakSelf, failedToFetchComments: error)
                break
            }
        }
    }
    
}
