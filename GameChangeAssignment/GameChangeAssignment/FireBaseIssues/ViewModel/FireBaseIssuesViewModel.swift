//
//  FireBaseIssuesViewModel.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

struct FireBaseIssuesViewModelInitParams {
    
}

class FireBaseIssuesViewModel: NSObject {
    
    //MARK: - Properties
    weak var viewDelegate:FireBaseIssuesViewModelDelegate?
    var firebaseIssueItemViewModels: [FireBaseIssueItemViewModel]?
    
    //MARK:- Computed Properties
    var navBarTitle: String {
        return "Issues"
    }
    
    //MARK: - Initialization methods
    init(params:FireBaseIssuesViewModelInitParams) {
        
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FireBaseIssuesViewModel {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseIssueItemViewModels?.count ?? 0
    }
    
    func getItemViewModel(atIndexPath indexPath: IndexPath) -> FireBaseIssueItemViewModel{
        return self.firebaseIssueItemViewModels![indexPath.row]
    }
    
}

//MARK: - API and Service call methods
extension FireBaseIssuesViewModel {
    
    func fetchFireBaseIssues() {
        
        let issuesRequest = FireBaseIssuesReuest()
        
        API.fetch(request: issuesRequest) { [weak self] (response) -> (Void) in
            
            guard let _WeakSelf = self else { return  }
            
            switch response {
            case .resource(let resource):
                if let fireBaseIssuesJSONArray = resource.fireBaseIssuesJSONArray {
                    _WeakSelf.populateIssuesItemViewModels(jsonArray: fireBaseIssuesJSONArray)
                }
                _WeakSelf.viewDelegate?.fireBaseIssuesViewModel(_WeakSelf, successfullyFetchedIssues: _WeakSelf.firebaseIssueItemViewModels!)
                break
                
            case .error(let error):
                _WeakSelf.viewDelegate?.fireBaseIssuesViewModel(_WeakSelf, failedToFetchIssues: error)
                break
            }
        }
    }
    
    private func populateIssuesItemViewModels(jsonArray: [JSON]) {
        
        if firebaseIssueItemViewModels == nil {
            firebaseIssueItemViewModels = [FireBaseIssueItemViewModel]()
        }
        
        for jsonItem in jsonArray {
            if let fireBaseIssue = GitRepoIssue.instance(fromJSON: jsonItem) {
                let itemViewModel = FireBaseIssueItemViewModel(issue: fireBaseIssue)
                self.firebaseIssueItemViewModels?.append(itemViewModel)
            }
        }
        
        sortIssuesByOrder()
    }
    
    private func sortIssuesByOrder() {
        
        guard let firebaseIssueItemViewModels = firebaseIssueItemViewModels, firebaseIssueItemViewModels.count > 0 else { return }
        
        self.firebaseIssueItemViewModels = self.firebaseIssueItemViewModels?.sorted(by: { (itemViewModel1, itemViewModel2) -> Bool in
            return itemViewModel1.updatedAt >= itemViewModel2.updatedAt
        })
    }
    
    
}
