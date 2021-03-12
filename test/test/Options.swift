//
//  Options.swift
//  SDUapp
//
//  Created by Macbook on 02.03.18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import Foundation
class Options{
    private var name : String?
    private var icon: String?
    
    init(_ name : String, _ icon: String) {
        self.name = name
        self.icon = icon
    }
    var getIcon : String?{
        get{return icon}
        
    }
    var getName : String?{
        get{return name}
        
    }
  
    
}

