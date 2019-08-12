//
//  UITableViewCellExtension.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func configure(itemViewModel: FireBaseIssueItemViewModel){
        selectionStyle = .none
        textLabel?.text = itemViewModel.issueTitle
        detailTextLabel?.text = itemViewModel.updatedAt
        if itemViewModel.isCommentsAvailable {
            accessoryType = .disclosureIndicator
        }else {
            accessoryType = .none
        }
    }
    
    func configure(withItemViewModel itemViewModel:FireBaseIssueCommentItemViewModel) {
        selectionStyle = .none
        textLabel?.text = itemViewModel.commentBody
        textLabel?.numberOfLines = 0
        detailTextLabel?.text = itemViewModel.authorName
    }
    
}
