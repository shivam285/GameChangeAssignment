//
//  FireBaseIssueCommentsViewController.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

class FireBaseIssueCommentsViewController: BaseViewController, ViewFromNib {

    //MARK: - IBOutlets
    @IBOutlet var tvTableView:UITableView!
    @IBOutlet var aiActivityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var viewModel:FireBaseIssueCommentsViewModel!{
        didSet{
            viewModel.viewDelegate = self
        }
    }
    
    //MARK: - App cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        configureView()
        
        aiActivityIndicator.startAnimating()
        viewModel.fetchIssueComments()
    }

    //MARK: - Private methods
    private func setupNavBar() {
        title = viewModel.navBarTitle
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        tvTableView.delegate = self
        tvTableView.dataSource = self
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FireBaseIssueCommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "commentTableViewCell")
        
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "commentTableViewCell")
        }
        let itemViewModel = viewModel.getItemViewModel(atIndexPath: indexPath)
        cell?.configure(withItemViewModel: itemViewModel)
        return cell!
    }
}

//MARK:- FireBaseIssueCommentsViewDelegate
extension FireBaseIssueCommentsViewController: FireBaseIssueCommentsViewDelegate {
    
    func freBaseIssueCommentsViewModel(_ viewModel: FireBaseIssueCommentsViewModel, fetchedIssueComments itemViewModels: [FireBaseIssueCommentItemViewModel]) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
            self.tvTableView.reloadData()
        }
    }
    
    func freBaseIssueCommentsViewModel(_ viewModel: FireBaseIssueCommentsViewModel, failedToFetchComments error: Error) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
        }
        print(error.localizedDescription)
    }
    
    
}
