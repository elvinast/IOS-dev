//
//  CustomSegue.swift
//  AnimationsDemo
//
//  Created by Эльвина on 29.03.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let destinationView = self.destination.view
        let sourceView = self.source.view
        UIView.animate(withDuration: 2, animations: {
            //animating
            sourceView?.alpha = 0
        }) { (Bool) in
            //completing
            destinationView?.alpha = 0
            self.source.present(self.destination, animated: false) {
                UIView.animate(withDuration: 2) {
                    destinationView?.alpha = 1
                }
            }
        }
    }
}
