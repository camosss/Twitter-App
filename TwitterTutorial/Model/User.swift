//
//  User.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/19.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    var profileImageUrl: URL?
    let username: String
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}
