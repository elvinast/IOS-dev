//
//  RegisterViewController.swift
//  TwitterApp
//
//  Created by Эльвина on 07.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerClicked(_ sender: UIButton) {
        let name = nameField.text
        let surname = surnameField.text
        let email = emailField.text
        let password = passwordField.text
        if email != "" && password != "" {
            indicator.startAnimating()
            Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] (result, error) in
                self?.indicator.stopAnimating()
//                print(email)
                self?.sendMessageToEmail()
//                print("hi2")
                if error == nil{
//                    print("hi1")
                    if name != "" && surname != ""{
//                        print("hi")
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        let date = dateFormatter.string(from: (self?.datePicker.date)!)
                        let userData = [
                            "email": email!,
                            "surname": surname!,
                            "name": name!,
                            "date": date
                        ]
                        Database.database().reference().child("users").child(result!.user.uid).setValue(userData)
                        self?.showMessage(title: "Success", message: "Please verify your email")
                    }
                }
                else{
                    self?.showMessage(title: "Error", message: "Some problem occured")
                }
                
            }
        }
    }
    
    func sendMessageToEmail(){
        Auth.auth().currentUser?.sendEmailVerification(completion: nil)
    } 
    
    func showMessage(title: String, message: String){
        //create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            if title != "Error"{
                self.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
