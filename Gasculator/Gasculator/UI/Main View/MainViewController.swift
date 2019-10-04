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

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationSelectView: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        initializeTheLocationManager()
        self.mapView.isMyLocationEnabled = true
    }
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locationManager.location?.coordinate

        cameraMoveToLocation(toLocation: location)

    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        
        self.locationSelectView.center.y += self.locationSelectView.frame.height
        self.locationSelectView.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction public func showLocationSelectView(_ sender: Any) {
//        self.locationSelectView.isHidden = false
        UIView.animate(withDuration: 0.3) {
         self.locationSelectView.center.y -= self.locationSelectView.frame.height
        }
    }
    
    @IBAction public func hideLocationSelectView(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
         self.locationSelectView.center.y += self.locationSelectView.frame.height
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 99
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripDestinationsTableViewCell", for: indexPath)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
}
