//
//  BaseViewController.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    func setupBackBarButtonItem() {
        let backButtonItem = UIBarButtonItem(image: UIImage(named:"backArrow"), style: .plain, target: self, action: #selector(actionBackButtonItem))
        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func setupDismissBarButtonItem() {
        
    }
    
    //MARK: - NavBarItem Actions
    @objc func actionBackButtonItem() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func actionDismissButtonItem() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
