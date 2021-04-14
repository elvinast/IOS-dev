//
//  EditProfileVC.swift
//  TwitterApp
//
//  Created by Эльвина on 15.04.2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class EditProfileVC: UIViewController {

    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newSurname: UITextField!
    @IBOutlet weak var newDate: UIDatePicker!
    
    var ref: DatabaseReference!
    var currentUser: User?
    var name: String?
    var surname: String?
    var date: String?
    var delegate: Editable?
    
//    let df = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        newDate.date = df.date(from: self.date!)!
        newName.text = name
        newSurname.text = surname
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        let df = DateFormatter()
        name = newName.text
        surname = newSurname.text
        df.dateFormat = "dd.MM.yyyy"
        date = df.string(from: newDate.date)
        delegate?.edit(name: newName.text!, surname: newSurname.text!, date: newDate.date)
//        self.ref.child("users/\(Auth.auth().currentUser!.uid)/name").setValue(newName.text)
//        self.ref.child("users/\(Auth.auth().currentUser!.uid)/surname").setValue(newSurname.text)
//        let df = DateFormatter()
//        df.dateFormat = "dd.MM.yyyy"
//        let date = df.string(from: newDate.date)
//        self.ref.child("users/\(Auth.auth().currentUser!.uid)/date").setValue(date)
        self.dismiss(animated: true, completion: nil)
        
        
//        let usersRef = ref.child("tweets")
//        let queryRef = usersRef.queryOrdered(byChild: "name").queryEqual(toValue: myName)
//        queryRef.observeSingleEvent(of: .value, with: { [self] (snapshot) in
//            for snap in snapshot.children {
//                let userSnap = snap as! DataSnapshot
//                let uid = userSnap.key //the uid of each user
//                let userDict = userSnap.value as! [String:AnyObject]
//                let timestamp = userDict["name"] as! String
////                self.ref.child("tweets/\(uid)/name").setValue(newName.text)
////                self.ref.child("tweets/\(uid)/surname").setValue(newSurname.text)
//                print("key = \(uid) and timestamp = \(timestamp)")
//            }
//        })

        
//        self.dismiss(animated: true, completion: nil)
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
