//
//  BrowserModel.swift
//  Browser
//
//  Created by Эльвина on 20.02.2021.
//

import Foundation
import UIKit

struct BrowserModel{
    var name: String?
    var link: String?
    var isFav: Bool = false
}

struct BrowserArray{
    static var browsers: [BrowserModel] =
        [
             BrowserModel(name: "Google", link: "https://www.google.com/"),
            BrowserModel(name: "Yahoo", link: "https://www.yahoo.com/"),
            BrowserModel(name: "Yandex", link: "https://yandex.kz/"),
            BrowserModel(name: "Leetcode", link: "https://leetcode.com/"),
            BrowserModel(name: "Github", link: "https://github.com/elvinast")
        ]
}
