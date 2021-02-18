//
//  CustomView.swift
//  Drawing
//
//  Created by Эльвина on 15.02.2021.
//

import UIKit

class CustomView: UIView {

    var point1: CGPoint?
    var point2: CGPoint! //if there is a point1,  there will be point2
    
    override func draw(_ rect: CGRect) {
        if let p1 = point1{
            let rect = Rectangle.init(p1: p1, p2: point2, color: .purple, strokeWidth: 3, isFilled: false)
            rect.drawPath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        setNeedsDisplay()
    }
    
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
