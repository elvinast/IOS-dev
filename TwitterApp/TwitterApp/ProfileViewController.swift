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
import FirebaseStorage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Editable {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var userNameSurname: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var userBirthday: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    var myTweets: [Tweet] = []
    var currentUser: User?
    
    private let storage = Storage.storage().reference()
    let ref = Database.database().reference()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ProfileCell
        cell?.content.text = myTweets[indexPath.row].content
        cell?.hashtag.text = "#" + myTweets[indexPath.row].hashtag!
        cell?.date.text = myTweets[indexPath.row].date
        
        cell?.contentView.layer.borderWidth = 1.0
        cell?.contentView.layer.borderColor = UIColor.blue.cgColor
        cell?.contentView.layer.cornerRadius = 10
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
        let editAction = UIContextualAction(style: .normal, title: "Edit", handler: { (contextualAction, view, boolValue) in
            let alert = UIAlertController(title: "Edit tweet", message: "Enter a text", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.text = self.myTweets[indexPath.row].content
            }
            alert.addTextField { (textField) in
                textField.text = self.myTweets[indexPath.row].hashtag
            }
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let newDate = formatter.string(from: date)
            
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { [weak alert] (_) in
                let myContent = alert?.textFields![0]
                let tag = alert?.textFields![1]
                
                let usersRef = self.ref.child("tweets")
                let queryRef = usersRef.queryOrdered(byChild: "tweet").queryEqual(toValue: self.myTweets[indexPath.row].content)
                queryRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    for snap in snapshot.children {
                        let userSnap = snap as! DataSnapshot
                        let uid = userSnap.key
                        let userDict = userSnap.value as! [String:AnyObject]
                        let content = userDict["tweet"] as! String
//                        self.ref.child("tweets/\(uid)").removeValue()
                        self.ref.child("tweets/\(uid)/hashtag").setValue(tag?.text)
                        self.ref.child("tweets/\(uid)/tweet").setValue(myContent?.text)
                        self.ref.child("tweets/\(uid)/date").setValue(newDate)
                        print("key = \(uid), content = \(content)")
                    }
                })
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
            self.myTableView.reloadData()
        })

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (contextualAction, view, boolValue) in
            let usersRef = self.ref.child("tweets")
            let queryRef = usersRef.queryOrdered(byChild: "tweet").queryEqual(toValue: self.myTweets[indexPath.row].content)
            queryRef.observeSingleEvent(of: .value, with: { (snapshot) in
                for snap in snapshot.children {
                    let userSnap = snap as! DataSnapshot
                    let uid = userSnap.key
                    let userDict = userSnap.value as! [String:AnyObject]
                    let content = userDict["tweet"] as! String
                    self.ref.child("tweets/\(uid)").removeValue()
                    print("key = \(uid), content = \(content)")
                }
            })
            self.myTweets.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
            self.myTableView.reloadData()
        })
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return swipeActions
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
        
        myTableView.rowHeight = 150
//        let users = Database.database().reference().child("users")
//        let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let surname = value?["surname"] as? String ?? ""
            let date = value?["date"] as? String ?? ""
//          print(name)
            self.userNameSurname.text = name
            self.surname.text = surname
            self.userBirthday.text = date
          }) { (error) in
            print(error.localizedDescription)
        }
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string: urlString) else {
                return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async { // to make sure that UI is updated as soon as we get the response
                let image = UIImage(data: data)
                self.myImageView.image = image
            }
        })
        task.resume()
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
    
    func edit(name: String, surname: String, date: Date) {
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/name").setValue(name)
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/surname").setValue(surname)
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        let newDate = df.string(from: date)
        self.ref.child("users/\(Auth.auth().currentUser!.uid)/date").setValue(newDate)
//        print(newDate)
        self.userNameSurname.text = name
        print(name)
        self.surname.text = surname
        self.userBirthday.text = newDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditProfileVC{
            destination.delegate = self
            destination.name = self.userNameSurname.text
            destination.surname = self.surname.text
            destination.date = self.userBirthday.text
//            print(destination.date)
//            print(self.userBirthday.text)
        }
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var img = UIImage()
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
                    myImageView.image = image
                    img = image
                }
        picker.dismiss(animated: true, completion: nil)
        
        guard let imageData = myImageView.image?.pngData() else{
            return
        }
        
        storage.child("images/file.png").putData(imageData, metadata: nil) { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            self.storage.child("images/file.png").downloadURL { url, error in
                guard let url = url, error == nil else{
                    return
                }
                let urlString = url.absoluteString
                
                DispatchQueue.main.async {
                    self.myImageView.image = img
                }
                
                print("Download URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            }
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

