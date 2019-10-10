//
//  MainViewController.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var SearchOriginTextField: UITextField!
    @IBOutlet weak var SearchDestinationTextField: UITextField!
    
    var locationManager = CLLocationManager()
        
        var originPoint: CLLocationCoordinate2D!
        var destinationPoint: GMSPlace!
        var bounds = GMSCoordinateBounds()
        
        var route: GMSPath!
        var rectangle = GMSPolyline()
        
        var isOrigin: Bool = false
        
        var ori: CLLocation!
        var des: CLLocation!
        
        enum JSONError: String, Error {
            case NoData = "ERROR: No Data!"
            case ConversionFailed = "ERROR: Conversion from JSON failed!"
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

            initializeTheLocationManager()
            self.mapView.isMyLocationEnabled = true
        }
        
    //    MARK: Delegates for Autocomplete
        
    @IBAction func onEditingDidBeginSearchOriginTextField(_ sender: Any) {
        self.isOrigin = true
        SearchOriginTextField.resignFirstResponder()
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        present(acController, animated: true, completion: nil)
    }
    
    @IBAction func OnEditingDidBeginDestinationSearchTextField(_ sender: Any) {
        self.isOrigin = false
        SearchDestinationTextField.resignFirstResponder()
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        present(acController, animated: true, completion: nil)
    }
    
    @IBAction func OnButton(_ sender: Any) {
        calculateDrivingDistance(origin: ori, destination: des)
    }
        
        func drawRoute(ori: CLLocation, des: CLLocation) {
            let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(ori.coordinate.latitude),\(ori.coordinate.longitude)&destination=\(des.coordinate.latitude),\(des.coordinate.longitude)&sensor=false&key=AIzaSyC946KOPL80LIVILtxgwp10CQbo5_S5CL0"
            
            guard let url = URL(string: urlString) else {
                print("Error: URL is broken")
                return
            }
            
            let urlRequest = URLRequest(url: url)
            
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
    //        let task = session.data
            
            let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                do {
                    guard let data = data else {
                        throw JSONError.NoData
                    }
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as?
                        NSDictionary else {
                            throw JSONError.ConversionFailed
                    }
                                    
                    let arrayRoutes = json["routes"] as! NSArray
                    let arrLegs = (arrayRoutes[0] as! NSDictionary).object(forKey: "legs") as! NSArray
                    let arrSteps = arrLegs[0] as! NSDictionary
                    
                    let dicDistance = arrSteps["distance"] as! NSDictionary
                    let distance = dicDistance["text"] as! String
                    
                    DispatchQueue.global(qos: .background).async {
                        let array = json["routes"] as! NSArray
                        let dic = array[0] as! NSDictionary
                        let dic1 = dic["overview_polyline"] as! NSDictionary
                        let points = dic1["points"] as! String

                        DispatchQueue.main.async {
                            let path = GMSPath(fromEncodedPath: points)
                            self.rectangle.map = nil
                            self.rectangle = GMSPolyline(path: path)
                            self.rectangle.strokeWidth = 4
                            self.rectangle.strokeColor = UIColor.blue
                            self.rectangle.map = self.mapView
                        }
                    }
                } catch let error as JSONError {
                    print(error.rawValue)
                } catch let error as NSError {
                    print(error.debugDescription)
                }
                
            })
            task.resume()
        }
        
        //    MARK: Functions for autolocation
        
        func initializeTheLocationManager() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            let location = locationManager.location
            if location != nil {
                originPoint = location?.coordinate
                ori = CLLocation(latitude: originPoint.latitude, longitude: originPoint.longitude)
                SearchOriginTextField.text = "Your Location"
                drawMarkers()
            }
            
            cameraMoveToLocation(toLocation: location?.coordinate)
        }

        func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
            if toLocation != nil {
                mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 14)
            }
        }
        
        func drawMarkers() {
            mapView.clear()
            
            if originPoint != nil {
                let marker = GMSMarker()
                marker.position = originPoint
                marker.title = "You are here!"
                marker.map = mapView
            }
            
            if destinationPoint != nil {
                let marker = GMSMarker()
                marker.position = destinationPoint.coordinate
                marker.title = destinationPoint.name
                marker.map = mapView
            }
        }
            
        func calculateDrivingDistance(origin: CLLocation, destination: CLLocation) {
            let orLat = origin.coordinate.latitude
            let orLon = origin.coordinate.longitude
            
            let DesLat = destination.coordinate.latitude
            let DesLon = destination.coordinate.longitude
            
            let strng = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=\(orLat),\(orLon)&destinations=\(DesLat),\(DesLon)&key=AIzaSyC946KOPL80LIVILtxgwp10CQbo5_S5CL0"
                    
            let url = URL(string: strng)!
                    
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let d = data, d.count > 0 {
                    let route = try? Route.init(from: d)
                    print(route?.distance)
                    print(route?.duration)
                }
            }

            task.resume()
           }
}

extension MainViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        if self.isOrigin == true {
            originPoint = place.coordinate
            SearchOriginTextField.text = place.name
            drawMarkers()
            ori = CLLocation(latitude: originPoint.latitude, longitude: originPoint.longitude)
            bounds = bounds.includingCoordinate(originPoint)
            if (self.originPoint != nil && self.destinationPoint != nil) {
                drawRoute(ori: ori, des: des)
            }
            dismiss(animated: true, completion: nil)
            return
        }
        
        if self.isOrigin == false {
            destinationPoint = place
            SearchDestinationTextField.text = place.name
            drawMarkers()
            des = CLLocation(latitude: destinationPoint.coordinate.latitude, longitude: destinationPoint.coordinate.longitude)
            if (self.originPoint != nil && self.destinationPoint != nil) {
                drawRoute(ori: ori, des: des)
            }
            dismiss(animated: true, completion: nil)
            return
        }
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
                print("Error: ", error.localizedDescription)
        }
        
        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            dismiss(animated: true, completion: nil)
        }
    }
