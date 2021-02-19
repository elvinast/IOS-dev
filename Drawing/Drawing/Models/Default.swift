//
//  Default.swift
//  Drawing
//
//  Created by Эльвина on 19.02.2021.
//

import Foundation
import UIKit

class Default{
    static var color: UIColor = .systemPink
    static var isFilled: Bool = false
    static var strokeWidth: CGFloat = 3
//    var colors: Array<UIColor> = [.systemPink, .yellow, .blue, .purple, .green, .systemIndigo, .orange]
    static var allModels: Array<Shape> = []
    static var curFigure: Shapes = Shapes.RECTANGLE
}
