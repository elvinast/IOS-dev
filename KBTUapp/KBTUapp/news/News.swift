//
//  News.swift
//  KBTUapp
//
//  Created by Эльвина on 12.03.2021.
//

import Foundation
import UIKit

class News {
    var name: String?
    var description: String?
    var image: UIImage? = UIImage.init(named: "news-1")
    var fullImage: UIImage?
    var fullText: String = "text"
    
    init(_ name: String, _ description: String, imgType: Int) {
        self.name = name
        self.description = description
        switch imgType {
        case 1:
            self.image = UIImage.init(named: "news-1")
        case 2:
            self.image = UIImage.init(named: "news-2")
        case 3:
            self.image = UIImage.init(named: "news-3")
        default:
            self.image = UIImage.init(named: "news-1")
        }
    }
}
