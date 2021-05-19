//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/17.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    var user: User?
    
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
//        logUserOut()
        view.backgroundColor = .twitterBlue
        checkIfUserIsLoggedIn()
    }
    
    // MARK: - API
    
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureViewControllers()
            configureUI()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
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
