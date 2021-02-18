//
//  Person.swift
//  ContactBook
//
//  Created by Эльвина on 11.02.2021.
//

import Foundation
import UIKit

class Person{
    
    var nameSurname: String?
    var phoneNumber: String?
    var gender: String?
    var image: UIImage?
    
    init(_ nameSurname: String, _ phoneNumber:String, _ gender: String) {
        self.nameSurname = nameSurname
        self.phoneNumber = phoneNumber
        self.gender = gender
        if gender == "female"{
            self.image = UIImage.init(named: "female")!
        }
        else if gender == "male"{
            self.image = UIImage.init(named: "male")!
        }
    }
}
