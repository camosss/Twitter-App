//
//  NotificationsController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit

private let reuseIdentifier = "NotificationCell"

class NotificationsController: UITableViewController {
    
    // MARK: - Properties
    
    private var notificatioins = [Notification]() {
        didSet { tableView.reloadData() }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchNotifications()
    }
    
    // MARK: - API
    
    func fetchNotifications() {
        NotificationService.shared.fetchNotifications { notificatioins in
            self.notificatioins = notificatioins
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
        
        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
    }

}

extension NotificationsController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificatioins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        cell.notification = notificatioins[indexPath.row]
        return cell
    }
}
