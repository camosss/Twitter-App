//
//  ProfileFilterViewModel.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/24.
//

import Foundation

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replise"
        case .likes: return "Likes"
        }
    }
}
