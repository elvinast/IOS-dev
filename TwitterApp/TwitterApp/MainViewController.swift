//
//  MainViewController.swift
//  TwitterApp
//
//  Created by Эльвина on 07.04.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    var tweets: [Tweet] = []
    var searchingTweets: [Tweet] = []
    var isSearching = false
    
    var currentUser: User?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return searchingTweets.count
        }
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as? CustomCell
        
        if isSearching{
            cell?.content.text = searchingTweets[indexPath.row].content
            cell?.nameSurname.text = searchingTweets[indexPath.row].author
            cell?.hashtag.text = "#" + searchingTweets[indexPath.row].hashtag!
            cell?.date.text = "Posted: " + searchingTweets[indexPath.row].date!
        } else{
            cell?.content.text = tweets[indexPath.row].content
            cell?.nameSurname.text = tweets[indexPath.row].author
            cell?.hashtag.text = "#" + tweets[indexPath.row].hashtag!
            cell?.date.text = "Posted: " + tweets[indexPath.row].date!
        }
        
        cell?.contentView.layer.borderWidth = 1.0
        cell?.contentView.layer.borderColor = UIColor.white.cgColor
        cell?.contentView.layer.cornerRadius = 10
        cell?.contentView.layer.shadowRadius = 10
        cell?.contentView.layer.shadowColor = UIColor.blue.cgColor
        cell?.contentView.layer.shadowOpacity = 0.35
        
        return cell!
    }
    

    override func viewDidLoad() {
        searchBar.delegate = self
        
//        searchBar.searchBarStyle = .minimal
//        searchBar.showsSearchResultsButton = true
        
        
        super.viewDidLoad()
        currentUser = Auth.auth().currentUser
        let parent = Database.database().reference().child("tweets")
        parent.observe(.value) { [weak self] (snapshot) in
            self?.tweets.removeAll()
            for child in snapshot.children{
                if let snap = child as? DataSnapshot{
                    let tweet = Tweet(snapshot: snap)
                    self?.tweets.append(tweet)
                }
            }
            self?.tweets.reverse()
            self?.myTableView.reloadData()
        }
        myTableView.rowHeight = 180
    }
    
    
    
    @IBAction func goToProfile(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mainPage = storyboard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController{
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
        }
    }
    
    @IBAction func composeTweet(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New tweet", message: "Enter a text", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "What's up?"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Add hashtag"
        }
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        alert.addAction(UIAlertAction(title: "Tweet", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let tag = alert?.textFields![1]
            let tweet = Tweet(textField!.text!, (self.currentUser?.email)!, tag!.text!, result)
            Database.database().reference().child("tweets").childByAutoId().setValue(tweet.dict)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingTweets.removeAll()
        for tweet in tweets {
            print(searchText.lowercased())
            if tweet.hashtag?.lowercased().range(of: searchText.lowercased()) != nil{
                searchingTweets.append(tweet)
            }
        }
        isSearching = true
        if searchText == "" {
            isSearching = false;
        }
        myTableView.reloadData()
    }
}
