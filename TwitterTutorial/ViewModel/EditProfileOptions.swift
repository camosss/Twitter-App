//
//  EditProfileOptions.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/23.
//

import Foundation

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio
    
    var description: String {
        switch self {
        case .username: return "Username"
        case .fullname: return "Name"
        case .bio: return "Bio"
        }
    }
}
