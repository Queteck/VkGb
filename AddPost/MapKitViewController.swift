//
//  MapKitViewController.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.06.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKitViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let coordinate = locations.last else { return }
        zoomIn(coordinate: coordinate)
        
    }
    @IBAction func closeMap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let coordinate = locationManager.location {
            zoomIn(coordinate: coordinate)
        }
    }

    private func zoomIn(coordinate: CLLocation) {
        let coder = CLGeocoder()
        coder.reverseGeocodeLocation(coordinate) {(myPlaces,Error) -> Void in
            if let place = myPlaces?.first {
                print(place.locality)
            }
        }
        let currentRadius: CLLocationDistance = 1000
        let currentRegion = MKCoordinateRegionMakeWithDistance((coordinate.coordinate), currentRadius *
            2.0, currentRadius * 2.0)
        self.mapView.setRegion(currentRegion, animated: true)
        self.mapView.showsUserLocation = true
    }

}
