//
//  CustomPin.swift
//  MapKitDemo
//
//  Created by Эльвина on 26.03.2021.
//

import Foundation
import MapKit

class CustomPin: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
