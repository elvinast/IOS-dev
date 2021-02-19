//
//  ViewController.swift
//  Drawing
//
//  Created by Эльвина on 15.02.2021.
//

import UIKit

class ViewController: UIViewController {

    var colors: Array<UIColor> = [.systemPink, .yellow, .blue, .purple, .green, .systemIndigo, .orange]
    
    var allModels: Array<Shapes> = [.CIRCLE, .RECTANGLE, .LINE, .TRIANGLE, .PEN]
    
    @IBOutlet weak var myCustomView: CustomView!
    
    @IBOutlet weak var removeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tap))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(long))
        tapGesture.numberOfTapsRequired = 1
        removeButton.addGestureRecognizer(tapGesture)
        removeButton.addGestureRecognizer(longGesture)
    }
    
    @objc func tap() {
        if Default.allModels.count > 0 {
            Default.allModels.removeLast()
            myCustomView.setNeedsDisplay()
        }
    }

    @objc func long() {
        if Default.allModels.count > 0 {
            Default.allModels.removeAll()
            myCustomView.setNeedsDisplay()
        }
    }
    @IBAction func isFilledPressed(_ sender: UISwitch) {
        Default.isFilled = sender.isOn
    }
    
    @IBAction func modelPressed(_ sender: UIButton) {
        Default.curFigure = allModels[sender.tag]
        print(sender.tag)
//        print(sender.currentImage)
        print(Default.curFigure)
    }
    @IBAction func colorPressed(_ sender: UIButton) {
        Default.color = colors[sender.tag]
        print(sender.tag)
    }
    
}

