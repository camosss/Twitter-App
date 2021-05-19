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
    let profileImageUrl: String
    let username: String
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
