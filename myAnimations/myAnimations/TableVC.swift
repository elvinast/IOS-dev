//
//  TableVC.swift
//  myAnimations
//
//  Created by Эльвина on 31.03.2021.
//

import UIKit

class TableVC: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    
    var allPhones: [Phone] = [
        Phone(name: "iPhone 7 Plus", price: "350$", info: "A10 Fusion", infoDetail: "12MPX"),
        Phone(name: "Samsung Galaxy S8", price: "500$", info: "Snapdragon 835", infoDetail: "12MPX"),
        Phone(name: "LG G4", price: "400$", info: "Snapdragon 808", infoDetail: "16MPX"),
        Phone(name: "Nexus 6P", price: "780$", info: "Snapdragon 812", infoDetail: "20MPX"),
        Phone(name: "HTC One M9", price: "350$", info: "Snapdragon 820", infoDetail: "16MPX"),
        Phone(name: "Google Pixel", price: "350$", info: "Snapdragon 821", infoDetail: "12MPX")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in myTableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPhones.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? CustomCell
        cell?.name.text = allPhones[indexPath.row].name
        cell?.price.text = allPhones[indexPath.row].price
        cell?.infoButton.tag = indexPath.row
//        print(cell?.frame.height)
        cell?.additionalView = showDetailed(index: indexPath.row, cell: cell!, phone: allPhones[indexPath.row])
        cell?.addSubview(cell!.additionalView)
        return cell!
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: -myTableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.3 * Double(indexPath.row),
            options: .curveEaseInOut,
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    
    @IBAction func infoPressed(_ sender: UIButton) {
        let cell = myTableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! CustomCell
        
        if cell.additionalView.isHidden {
            UIView.transition(with: cell.additionalView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                cell.addSubview(cell.additionalView)
                cell.additionalView.alpha = 1
                cell.additionalView.isHidden = false
            })
        }
        
        else {
            UIView.animate(withDuration: 0.1) {
                cell.additionalView.frame.origin.x = cell.additionalView.frame.width
                cell.additionalView.alpha = 0
            } completion: { (Bool) in
                cell.additionalView.frame.origin.x = 0
                cell.additionalView.isHidden = true
            }
        }
    }
    
    func showDetailed(index: Int, cell: UITableViewCell, phone: Phone) -> UIView {
        let detailed = UIView()
        detailed.backgroundColor = .systemPink
        detailed.isHidden = true
        detailed.bounds.size.width = cell.frame.width
        detailed.bounds.size.height = cell.frame.height
        detailed.frame.origin.x = 0
        detailed.frame.origin.y = 0
        
        let name = UILabel()
        let price = UILabel()
        let hideButton = UIButton()
        
        name.text = phone.info
        name.textColor = .white
        name.font = UIFont.boldSystemFont(ofSize: 23.0)
        name.frame.size.height = CGFloat(20)
        
        price.text = phone.infoDetail
        price.textColor = .white
        price.font = UIFont.boldSystemFont(ofSize: 18.0)
        price.frame.size.height = CGFloat(20)
        
        hideButton.tag = index
        hideButton.setTitle("hide", for: UIControl.State.normal)
        hideButton.setTitleColor(.white, for: UIControl.State.normal)
        hideButton.layer.borderWidth = 2
        hideButton.layer.cornerRadius = 5
        hideButton.layer.borderColor = UIColor.white.cgColor
        hideButton.frame.size.height = CGFloat(30)
        hideButton.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)

        detailed.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: detailed.topAnchor, constant: CGFloat(10)).isActive = true
        name.leftAnchor.constraint(equalTo: detailed.leftAnchor, constant: CGFloat(50)).isActive = true
        name.rightAnchor.constraint(equalTo: detailed.rightAnchor, constant: CGFloat(-90)).isActive = true

        detailed.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: CGFloat(5)).isActive = true
        price.leftAnchor.constraint(equalTo: detailed.leftAnchor, constant: CGFloat(50)).isActive = true
        price.rightAnchor.constraint(equalTo: detailed.rightAnchor, constant: CGFloat(-90)).isActive = true
        
        detailed.addSubview(hideButton)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.rightAnchor.constraint(equalTo: detailed.rightAnchor, constant: CGFloat(-20)).isActive = true
        hideButton.centerYAnchor.constraint(equalTo: detailed.centerYAnchor).isActive = true
        hideButton.leftAnchor.constraint(equalTo: name.rightAnchor, constant: CGFloat(10)).isActive = true
        return detailed
    }
}
