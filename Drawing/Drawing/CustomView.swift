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
    
//    var color: UIColor = .systemPink
//    var isFilled: Bool = true
//    var strokeWidth: CGFloat = 3
//    var colors: Array<UIColor> = [.systemPink, .yellow, .blue, .purple, .green, .systemIndigo, .orange]
//    var shapes: Array<Shape> = []
//    var curFigure = Shapes.CIRCLE
    
    
    override func draw(_ rect: CGRect) {
        for model in Default.allModels{
            model.drawPath()
        }
//        if let p1 = point1{
//            let rect = Rectangle.init(p1: p1, p2: point2, color: .purple, strokeWidth: 3, isFilled: false)
//            rect.drawPath()
//        }
    }
    
    func createNewModel(){
        if point1 != nil{
            let isFilled = Default.isFilled
            let color = Default.color
            let strokeWidth = Default.strokeWidth

            switch Default.curFigure {
            case .LINE, .PEN:
                let line = Line(p1: point1!, p2: point2, color: color, strokeWidth: strokeWidth)
                Default.allModels.append(line)
            case .CIRCLE:
                let radius = abs(point2.x - point1!.x) / 2
                let center = CGPoint(x:(point2.x + point1!.x) / 2, y:(point2.y + point1!.y) / 2)
                let circle = Circle(with: radius, and: center, withSome: color, and: strokeWidth, isFilled: isFilled)
                Default.allModels.append(circle)
            case .RECTANGLE:
                let rect = Rectangle.init(p1: point1!, p2: point2, color: color, strokeWidth: strokeWidth, isFilled: isFilled)
                Default.allModels.append(rect)
            case .TRIANGLE:
                let p1 = CGPoint(x: min(point1!.x, point2.x), y: min(point1!.y, point2.y))
                let p2 = CGPoint(x: max(point1!.x, point2.x), y: max(point1!.y, point2.y))
                let triangle = Triangle(p1: p1, p2: p2, color: color, strokeWidth: strokeWidth, isFilled: isFilled)
                Default.allModels.append(triangle)
//            case .PEN:
//                let line =  Line(p1: point1!, p2: point2, color: color, strokeWidth: strokeWidth)
//                Default.allModels.append(line)
            default:
                break
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            if Default.curFigure == Shapes.PEN{
                point2 = touch.location(in: self)
                createNewModel()
                point1 = point2
                setNeedsDisplay()
            }
//            point2 = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        createNewModel()
        setNeedsDisplay()
    }
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
