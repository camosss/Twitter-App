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
    
    static func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        COLLECTION_TWEETS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let istweets = documents.map({ Tweet(tweetID: $0.documentID, dictionary: $0.data()) })
            tweets.append(contentsOf: istweets)
            completion(tweets)
        }
    }
    
    // Realtime Database
//        COLLECTION_TWEETS.observe(.childAdded) { snapshot in
//            guard let dictionary = snapshot.value as? [String: Any] else { return }
//            let tweetID = snapshot.key
//            let tweet = Tweet(tweetID: tweetID, dictionary: dictionary)
//            tweets.append(tweet)
//            completion(tweets)
        }


