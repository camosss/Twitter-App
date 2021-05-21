//
//  Tweet.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/21.
//

import Firebase

struct Tweet {
    let caption: String
    let tweetID: String
    let uid: String
    let likes: Int
    let timestamp: Timestamp
    let retweetCount: Int
    
    init(tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweets"] as? Int ?? 0
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
