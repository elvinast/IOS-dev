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
    
    var myTweets: [Tweet] = []
    var currentUser: User?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
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
                    self?.myTweets.append(tweet)
                }
            }
            self?.myTweets.reverse()
//            self?.myTableView.reloadData()
        }
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
        } catch{
            print("Error message")
        }
        self.dismiss(animated: true, completion: nil)
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
