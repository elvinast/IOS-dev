//
//  Line.swift
//  Drawing
//
//  Created by Эльвина on 19.02.2021.
//

import Foundation
import UIKit

class Line: Shape{
    
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var strokeWidth: CGFloat = 0.0
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, strokeWidth: CGFloat){
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.strokeWidth = strokeWidth
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        
        path.lineWidth = strokeWidth
        color.set()
        path.stroke()
    }
    
}
