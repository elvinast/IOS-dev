//
//  CustomSegue.swift
//  myAnimations
//
//  Created by Эльвина on 31.03.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let destinationView = self.destination
        let sourceView = self.source
        
        let containerView = sourceView.view.superview
        let originalCenter = sourceView.view.center
        
        destinationView.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        destinationView.view.center = originalCenter
        
        containerView?.addSubview(destinationView.view)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            //animating
            destinationView.view.transform = CGAffineTransform.identity
            sourceView.view.alpha = 0
        }, completion: { success in
            destinationView.modalPresentationStyle = .fullScreen
            sourceView.present(destinationView, animated: false, completion: nil)
        })
    }
}
