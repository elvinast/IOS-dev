//
//  ProfileViewController.swift
//  TwitterApp
//
//  Created by Эльвина on 09.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var userBirthday: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    var myTweets: [Tweet] = []
    var currentUser: User?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myTweets[indexPath.row].content
        cell.detailTextLabel?.text = myTweets[indexPath.row].author
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = Auth.auth().currentUser
        
        let parent = Database.database().reference().child("tweets")
        parent.observe(.value) { [weak self] (snapshot) in
            self?.myTweets.removeAll()
            for child in snapshot.children{
                if let snap = child as? DataSnapshot{
                    let tweet = Tweet(snapshot: snap)
                    if tweet.author == self?.currentUser?.email{
                        self?.myTweets.append(tweet)
                    }
                }
            }
            self?.myTweets.reverse()
            self?.myTableView.reloadData()
        }
        
//        let users = Database.database().reference().child("users")
        let ref = Database.database().reference()
//        ref.child("users/\(currentUser?.uid)/name").getData { [self] (error, snapshot) in
//            if let error = error {
//                    print("Error getting data \(error)")
//                }
//                else if snapshot.exists() {
//                    print("Got data \(snapshot.value!)")
//                }
//                else {
//                    print(ref.child("users/\(currentUser?.uid)/"))
//                    print("No data available")
//                }
//        }
//        print(users)
//        users.observe(DataEventType.value) { (snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//        }
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let surname = value?["surname"] as? String ?? ""
            let date = value?["date"] as? String ?? ""
//          print(name)
            self.userNameSurname.text = name + " " + surname
            self.userBirthday.text = date
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
        } catch{
            print("Error message")
        }
        goToLoginPage()
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToAllTweets(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mainPage = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController{
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
        }
    }
    @IBAction func photoPickerButton(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func goToLoginPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mainPage = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController{
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
        }
    }
    @IBAction func addNewTweet(_ sender: UIButton) {
        
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
                    myImageView.image = image
                }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

