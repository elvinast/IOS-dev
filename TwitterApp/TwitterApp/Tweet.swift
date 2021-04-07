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
    
    init(_ content: String, _ author: String){
        self.content = content
        self.author = author
    }
    
    var dict: [String: String]{
        return [
            "tweet": content!,
            "author": author!
         ]
    }
    
    init(snapshot: DataSnapshot) {
        //convert from snapshot to regular field
        if let value = snapshot.value as? [String: String]{
            content = value["tweet"]
            author = value["author"]
        }
    }
}
