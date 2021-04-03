//
//  EditViewController.swift
//  MapKitDemo
//
//  Created by Эльвина on 26.03.2021.
//

import UIKit
import MapKit

protocol changePlace {
    func change(_ title: String, _ subtitle: String)
}

class EditViewController: UIViewController {
    
    var changeDelegate: changePlace?
    var titleStr: String?
    var subtitleStr: String?
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var subtitleTF: UITextField!
    override func viewDidLoad() {
        titleTF.text = titleStr
        subtitleTF.text = subtitleStr
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
    }
    
    @objc func addTapped() {
        print("added 1")
        changeDelegate?.change(titleTF.text!, subtitleTF.text!)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @objc func cancelPressed(sender: UIButton!) {
        print("canceled 1")
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

