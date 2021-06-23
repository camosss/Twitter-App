//
//  EditProfileController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/23.
//

import UIKit

class EditProfileController: UITableViewController {
    
    // MARK: - Properties
    
    private let user: User
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    
    // MARK: - Action
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleDone() {
        print("Done")
    }
    
    // MARK: - Helpers
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false // 반투명
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.title = "Edit Profile"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
}
