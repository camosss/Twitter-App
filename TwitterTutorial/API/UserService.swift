//
//  UserService.swift
//  TwitterTutorial
//
//  Created by 강호성 on 2021/05/19.
//

import Firebase

struct UserService {
    static func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(uid: uid, dictionary: dictionary)

            completion(user)
        }
    }
}
