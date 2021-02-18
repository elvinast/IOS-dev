//
//  Contacts.swift
//  ContactBook
//
//  Created by Эльвина on 12.02.2021.
//

import Foundation

class Contacts{
    var contacts: Array<Person> = [Person("Elvina", "+777777777", "female")]
    
    func removeContact(_ index: Int){
        contacts.remove(at: index)
    }
    
    func addContact(_ contact: Person){
        contacts.append(contact)
    }
}
