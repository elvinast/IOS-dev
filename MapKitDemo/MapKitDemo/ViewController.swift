//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Эльвина on 24.03.2021.
//

import UIKit
import MapKit
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, changePlace {
    func change(_ title: String, _ subtitle: String) {
        let index = places.firstIndex(where: {$0.title == selectedAnnotation?.title && $0.subtitle == selectedAnnotation?.subtitle})!
        let indexInAnn = self.myMap.annotations.firstIndex(where: {$0.title == places[index].title && $0.subtitle == places[index].subtitle})!
        let latt = self.myMap.annotations[indexInAnn].coordinate.latitude
        let long = self.myMap.annotations[indexInAnn].coordinate.longitude
        deleteData(places[index])
        saveData(title, subtitle, latt, long)
        places = loadData()
        showData(places)
    }
    
    
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var mySegm: UISegmentedControl!
    @IBOutlet weak var navView: UIVisualEffectView!
    var mapType: [Int: MKMapType] = [0: .hybrid, 1: .standard, 2: .satellite]
    var places: [Place] = []
    override func viewDidLoad() {
        myTable.separatorColor = .clear
        super.viewDidLoad()
        myTable.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        navView.addGestureRecognizer(tap)
        places = loadData()
        showData(places)
        let longPressGestureRecogn = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotation(press:)))
        longPressGestureRecogn.minimumPressDuration = 2.0
        myMap.addGestureRecognizer(longPressGestureRecogn)
    }
    
    @IBAction func tableViewPressed(_ sender: UIBarButtonItem) {
        if (myTable.isHidden == true) {
            myTable.isHidden = false
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = myMap.bounds
            myMap.addSubview(blurView)
        }else{
            myTable.isHidden = true
            myMap.subviews[myMap.subviews.count - 1].removeFromSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTable.isHidden = true
        myMap.subviews[myMap.subviews.count - 1].removeFromSuperview()
        let index = self.myMap?.annotations.firstIndex(where: {$0.title == places[indexPath.row].title && $0.subtitle == places[indexPath.row].subtitle})!
        self.myMap?.selectAnnotation(self.myMap.annotations[index!], animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @objc func doubleTapped(tap: UITapGestureRecognizer) {
        if (tap.state == UIGestureRecognizer.State.ended) {
            if (self.myMap?.annotations.count != 0 ){
                let point = tap.location(in: self.view)
                if (point.x > UIScreen.main.bounds.width / 2) {
                    print("right")
                    if let selectedAnnotation = selectedAnnotation {
                        print("ff")
                        let indexInPlaces = places.firstIndex(where: {$0.title == selectedAnnotation.title && $0.subtitle == selectedAnnotation.subtitle})!
                        
                        if (indexInPlaces == places.count - 1) {
                            print(indexInPlaces)
                            let index = self.myMap?.annotations.firstIndex(where: {$0.title == places[0].title && $0.subtitle == places[0].subtitle})!
                            self.myMap?.selectAnnotation(self.myMap.annotations[index!], animated: true)
                        }
                        else {
                            print(indexInPlaces)
                            let index = self.myMap?.annotations.firstIndex(where: {$0.title == places[indexInPlaces+1].title && $0.subtitle == places[indexInPlaces+1].subtitle})!
                            
                            self.myMap?.selectAnnotation(self.myMap.annotations[index!], animated: true)
                        }
                    }
                }
                else{
                    print("left")
                    if let selectedAnnotation = selectedAnnotation {
                        print("ff")
                        let indexInPlaces = places.firstIndex(where: {$0.title == selectedAnnotation.title && $0.subtitle == selectedAnnotation.subtitle})!
                        
                        if (indexInPlaces == 0) {
                            print(indexInPlaces)
                            let index = self.myMap?.annotations.firstIndex(where: {$0.title == places[places.count - 1].title && $0.subtitle == places[places.count - 1].subtitle})!
                            self.myMap?.selectAnnotation(self.myMap.annotations[index!], animated: true)
                        }
                        else {
                            print(indexInPlaces)
                            let index = self.myMap?.annotations.firstIndex(where: {$0.title == places[indexInPlaces-1].title && $0.subtitle == places[indexInPlaces-1].subtitle})!
                            self.myMap?.selectAnnotation(self.myMap.annotations[index!], animated: true)
                        }
                    }
                }
            }
        }
    }
    
    var selectedAnnotation: MKPointAnnotation?
    func mapView(_ myMap: MKMapView, didSelect view: MKAnnotationView) {
        self.selectedAnnotation = view.annotation as? MKPointAnnotation
        self.navigationItem.title = selectedAnnotation?.title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func addAnnotation(press: UILongPressGestureRecognizer){
        if press.state == .began {
            let alert = UIAlertController(title: "Add Place", message: "Fill all the fields", preferredStyle: .alert)
            let loc = press.location(in: myMap)
            let coordinates = myMap.convert(loc, toCoordinateFrom: myMap)
            let saveAction = UIAlertAction(title: "Add", style: .default) { [self]
                (UIAlertAction) in
                let name = alert.textFields?[0].text ?? ""
                let location = alert.textFields?[1].text ?? ""
                self.saveData(name, location, coordinates.latitude, coordinates.longitude)
                self.places = loadData()
                showData(self.places)
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Enter title"
            }
            alert.addTextField { (textField) in
                textField.placeholder = "Enter subtitle"
            }
            alert.addAction(saveAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//        let annotaionView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
//        annotaionView.image = UIImage(named: "pin")
//        annotaionView.canShowCallout = true
//        let btn = UIButton(type: .detailDisclosure)
//        annotaionView.rightCalloutAccessoryView = btn
//        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return annotaionView
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = places[indexPath.row].title
        cell.detailTextLabel?.text = places[indexPath.row].subtitle
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteData(places[indexPath.row])
            places = loadData()
            tableView.reloadData()
            places = loadData()
            showData(places)
        }
    }
        
        @objc func buttonAction(sender: UIButton!) {
            let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            navigationController?.pushViewController(editVC, animated: true)
            editVC.titleStr = selectedAnnotation?.title
            editVC.subtitleStr = selectedAnnotation?.subtitle
            editVC.changeDelegate = self
            print("Button tapped")
        }
    
    @IBAction func longTapped(_ sender: UILongPressGestureRecognizer) {
        
        //convert CGPoint to CLLocation2D
        let touchPoint = sender.location(in: myMap)
        let coordinate = self.myMap.convert(touchPoint, toCoordinateFrom: self.myMap)
        
        let alert = UIAlertController(title: "New location", message: "Fill the fields", preferredStyle: .alert)
        alert.addTextField{ (textField) in
            textField.placeholder = "Location"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "Description"
        }
        let saveAction = UIAlertAction(title: "Ok", style: .default) { [self] (UIAlertAction) in
            let location = alert.textFields?[0].text ?? ""
            let description = alert.textFields?[1].text ?? ""
            
            let annotation = MKPointAnnotation()
            annotation.title = location
            annotation.subtitle = description
            annotation.coordinate = coordinate
            
            myMap.addAnnotation(annotation)
//            myMap.setRegion(<#T##region: MKCoordinateRegion##MKCoordinateRegion#>, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
            switch mySegm.selectedSegmentIndex {
            case 0:
                myMap.mapType = .standard
            case 1:
                myMap.mapType = .satellite
            case 2:
                myMap.mapType = .hybrid
            default:
                break
            }
//        myMap.mapType = mapType[sender.selectedSegmentIndex] ?? .standard
    }

        func showData(_ places: [Place]) {
            myMap.removeAnnotations(myMap.annotations)
            for place in places {
                let annotation =  MKPointAnnotation()
                annotation.coordinate.latitude = place.latitude
                annotation.coordinate.longitude = place.longitude
                annotation.title = place.title
                annotation.subtitle = place.subtitle
                myMap.addAnnotation(annotation)
                self.myMap.delegate = self
            }
        }
        func loadData() -> [Place] {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let context = appDelegate.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<Place>(entityName: "Place")
                do{
                    try places = context.fetch(fetchRequest)
                }catch{
                    print("Hello error! Go away!")
                }
            }
            myTable.reloadData()
            return places
        }
        
        func saveData(_ name: String, _ location: String, _ latitude: Double, _ longitude: Double) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let context = appDelegate.persistentContainer.viewContext
                if let entity = NSEntityDescription.entity(forEntityName: "Place", in: context) {
                    let character = NSManagedObject(entity: entity, insertInto: context)
                    character.setValue(name, forKey: "title")
                    character.setValue(location, forKey: "subtitle")
                    character.setValue(latitude, forKey: "latitude")
                    character.setValue(longitude, forKey: "longitude")
                    do{
                        try context.save()
                        places.append(character as! Place)
                    }catch{
                        print("Warning! Error is here!")
                    }
                }
            }
        }
        func deleteData(_ object: Place) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let context = appDelegate.persistentContainer.viewContext
                context.delete(object)
                do{
                    try context.save()
                }
                catch{
                    
                }
            }
        }
    }
