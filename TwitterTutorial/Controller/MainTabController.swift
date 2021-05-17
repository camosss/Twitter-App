//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    // MARK: - Helpers
    
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
