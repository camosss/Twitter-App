//
//  ExploreController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit

private let reuseIdentifier = "UserCell"

class ExploreController: UITableViewController {
    
    // MARK: - Properties
    
    private var users = [User]() {
        didSet { tableView.reloadData() }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    
    // MARK: - API
    
    func fetchUsers() {
        UserService.shared.fetchUsers { users in
            self.users = users
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }

}

    // MARK: - UITableViewDataSource

extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        // 각 cell에 속하는 사용자 개체를 채워야함 -> 사용자인덱스와 같도록
        cell.user = users[indexPath.row]
        return cell
    }
}
