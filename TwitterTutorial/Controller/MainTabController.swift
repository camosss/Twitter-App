//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Actions
    
    @objc func actionButtonTapped() {
        
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let feed = templateNavigationController(image: #imageLiteral(resourceName: "home_unselected"), rootViewController: FeedController())
        
        let explore = templateNavigationController(image: #imageLiteral(resourceName: "search_unselected"), rootViewController: ExploreController())

        let notifications = templateNavigationController(image: #imageLiteral(resourceName: "like_unselected"), rootViewController: NotificationsController())
        
        let conversations = templateNavigationController(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), rootViewController: ConversationsController())

        
        viewControllers = [feed, explore, notifications, conversations]
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    

}
