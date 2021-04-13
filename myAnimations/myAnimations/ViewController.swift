//
//  ViewController.swift
//  myAnimations
//
//  Created by Эльвина on 31.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTextFields()
        animateNextButton()
    }
    
    func animateNextButton(){
        nextButton.alpha = 0
        UIView.animate(withDuration: 2) {
            self.nextButton.alpha = 1
        }
        nextButton.layer.cornerRadius = 10
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.white.cgColor
    }

    func animateTextFields() {
        self.mailTextField.center = CGPoint(x: -200, y: self.mailTextField.frame.midY)
        self.passwordTextField.center = CGPoint(x: self.view.bounds.width + 200, y: self.passwordTextField.frame.midY)
        UIView.animate(withDuration: 3) {
            self.mailTextField.center = CGPoint(x: self.view.bounds.width / 2, y: self.mailTextField.frame.midY)
            self.passwordTextField.center = CGPoint(x: self.view.bounds.width / 2, y: self.passwordTextField.frame.midY)
        }
        
    }
    @IBAction func pressedNextButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.mailTextField.center = CGPoint(x: -200, y: self.mailTextField.frame.midY)
            self.passwordTextField.center = CGPoint(x: self.view.bounds.width + 200, y: self.passwordTextField.frame.midY)
        }
    }
}

