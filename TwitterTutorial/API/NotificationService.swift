//
//  NotificationService.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/06/11.
//

import Firebase

struct NotificationService {
    static let shared = NotificationService()
                                                    // 여기에 트윗을 전달
    func uploadNotification(type: NotificationType, tweet: Tweet? = nil) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        var values: [String: Any] = ["timestamp": Int(NSDate().timeIntervalSince1970),
                                     "uid": uid,
                                     "type": type.rawValue]
        
        if let tweet = tweet {
            values["tweetID"] = tweet.tweetID
            REF_NOTIFICATIONS.child(tweet.user.uid).childByAutoId().updateChildValues(values)
        } else {
            
        }
    }
}
