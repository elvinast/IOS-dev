//
//  Tweet.swift
//  TwitterApp
//
//  Created by Эльвина on 07.04.2021.
//

import Foundation
import FirebaseDatabase

struct Tweet{
    
    var content: String?
    var author: String?
    var date: String?
    var hashtag: String?
        
    init(_ content: String, _ author: String, _ hashtag: String, _ date: String) {
        self.content = content
        self.author = author
        self.date = date
        self.hashtag = hashtag
    }
    
    var dict: [String: String]{
        return [
            "tweet": content!,
            "author": author!,
            "date": date!,
            "hashtag": hashtag!
         ]
    }
    
    init(snapshot: DataSnapshot) {
        //convert from snapshot to regular field
        if let value = snapshot.value as? [String: String]{
            content = value["tweet"]
            author = value["author"]
            date = value["date"]
            hashtag = value["hashtag"]
        }
    }
}
