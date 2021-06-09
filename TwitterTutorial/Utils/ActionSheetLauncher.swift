//
//  ActionSheetLauncher.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/09.
//

import UIKit

private let reuserIdentifier = "ActionSheetCell"

class ActionSheetLauncher: NSObject {
    
    // MARK: - Properties
    
    private let user: User
    private let tableView = UITableView()
    private var window: UIWindow? // 앱이 포함된 창을 나타낸다
    
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init()
        
        configureTableView()
    }
    
    
    // MARK: - Helpers
    
    // actionSheet 보이기
    func show() {
        print("DEBUG: Show action sheet for user \(user.username)")
        
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        self.window = window
        
        window.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: window.frame.height - 300, width: window.frame.width, height: 300)
    }
    
    func configureTableView() {
        tableView.backgroundColor = .twitterBlue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 5
        tableView.isScrollEnabled = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuserIdentifier)
    }
}

    // MARK: - UITableViewDataSource

extension ActionSheetLauncher: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuserIdentifier, for: indexPath)
        return cell
    }
}

    // MARK: - UITableViewDelegate

extension ActionSheetLauncher: UITableViewDelegate {
    
}
