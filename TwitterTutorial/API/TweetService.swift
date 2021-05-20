//
//  TweetService.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/20.
//

import Firebase

typealias FireStoreCompletion = (Error?) -> Void

struct TweetService {
    
    static func uploadTweet(caption: String, completion: @escaping(FireStoreCompletion)) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                      "timestamp": Timestamp(date: Date()),
                      "likes": 0,
                      "retweets": 0,
                      "caption": caption] as [String: Any]
        
        COLLECTION_TWEETS.addDocument(data: data, completion: completion)
    }
}
