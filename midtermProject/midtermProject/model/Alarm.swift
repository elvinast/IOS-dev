//
//  Alarm.swift
//  midtermProject
//
//  Created by Эльвина on 12.03.2021.
//

import Foundation
import UIKit

class Alarm{
    var time: String?
    var description: String?
    var isSwitched: Bool = true
    
    init(time: String, description: String, isSwitched: Bool) {
        self.time = time
        self.description = description
        self.isSwitched = isSwitched
    }
}
