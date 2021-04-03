//
//  ViewController.swift
//  AnimationsDemo
//
//  Created by Эльвина on 29.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animatePressed(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Fade out":
            UIView.animate(withDuration: 1){
                self.targetImage.alpha = 0
            }
        case "Fade in":
            UIView.animate(withDuration: 1){ [weak self] in
                self?.targetImage.alpha = 1
            }
        case "Move":
            UIView.animate(withDuration: 1){
                self.targetImage.center = CGPoint(x: 150, y: 150)
            }
        case "Back":
            UIView.animate(withDuration: 1){
                self.targetImage.center = CGPoint(x: self.view.bounds .width / 2, y: self.view.bounds.height / 2)
            }
        case "Zoom in":
            UIView.animate(withDuration: 1){
                self.targetImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
        case "Zoom out":
            UIView.animate(withDuration: 1){
                self.targetImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        default:
            break
        }
    }
    
}

