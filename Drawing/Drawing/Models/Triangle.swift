//
//  Triangle.swift
//  Drawing
//
//  Created by Эльвина on 19.02.2021.
//

import Foundation
import UIKit

class Triangle: Shape {
    
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var strokeWidth: CGFloat = 0.0
    private var isFilled: Bool
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, strokeWidth: CGFloat, isFilled: Bool){
        self.p1 = p1
        self.p2 = p2
        self.p3 = CGPoint(x: CGFloat(min(p1.x, p2.x)), y: CGFloat(max(p1.y, p2.y)))
        self.color = color
        self.strokeWidth = strokeWidth
        self.isFilled = isFilled
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p1)
        path.addLine(to: p2)
//        path.addLine(to: p3)
        path.lineWidth = strokeWidth
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
    
}
