//
//  UploadTweetViewModel.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/04.
//

import UIKit

enum UploadTweetConfiguration {
    case tweet
    case reply(Tweet)
}

struct UploadTweetViewModel {
    
    let actionButtonTitle: String
    let placeholderText: String
    var shoulShowReplyLabel: Bool
    var replyText: String?
    
    init(config: UploadTweetConfiguration) {
        switch config {
        case .tweet:
            actionButtonTitle = "Tweet"
            placeholderText = "What's happening"
            shoulShowReplyLabel = false
            // reply를 사용할 때마다 답장하는 트윗에 access
        case .reply(let tweet):
            actionButtonTitle = "Reply"
            placeholderText = "Tweet your reply"
            shoulShowReplyLabel = true
            replyText = "Replying to @\(tweet.user.username)"
        }
    }
}
