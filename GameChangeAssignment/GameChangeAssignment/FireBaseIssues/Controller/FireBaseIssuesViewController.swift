//
//  FireBaseIssuesViewController.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

class FireBaseIssuesViewController: BaseViewController, ViewFromNib {

    //MARK: - IBOutlets
    @IBOutlet var tvTableView:UITableView!
    @IBOutlet var aiActivityIndicator:UIActivityIndicatorView!
    
    //MARK: - Properties
    var viewModel:FireBaseIssuesViewModel!{
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
        viewModel.fetchFireBaseIssues()
    }

    //MARK: Private methods
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
    
    //MARK: - IBActions
    private func presentCommentsListViewController(issue: GitRepoIssue) {
        if let controller:FireBaseIssueCommentsViewController = FireBaseIssueCommentsViewController.viewController() {
            controller.viewModel = FireBaseIssueCommentsViewModel(params: FireBaseIssueCommentsViewModelInitParams(issue: issue))
            self.show(controller, sender: self)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FireBaseIssuesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "FireBaseIssueTableViewCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "FireBaseIssueTableViewCell")
        }
        
        
        let itemViewModel = viewModel.getItemViewModel(atIndexPath: indexPath)
        cell!.configure(itemViewModel: itemViewModel)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let itemViewModel = viewModel.getItemViewModel(atIndexPath: indexPath)
        if itemViewModel.isCommentsAvailable {
            presentCommentsListViewController(issue: itemViewModel.issue)
        }
        
    }
    
}

//MARK: - FireBaseIssuesViewModelDelegate
extension FireBaseIssuesViewController : FireBaseIssuesViewModelDelegate {
    
    func fireBaseIssuesViewModel(_ viewModel: FireBaseIssuesViewModel, successfullyFetchedIssues itemViewModels: [FireBaseIssueItemViewModel]) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
            self.tvTableView.reloadData()
        }
    }
    
    func fireBaseIssuesViewModel(_ viewModel: FireBaseIssuesViewModel, failedToFetchIssues error: Error) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
        }
        print(error.localizedDescription)
    }
    
    
}
