//
//  MyLocationVC.swift
//  WhetherApp
//
//  Created by jitendra on 30/04/22.
//

import UIKit
import MapKit
import CoreLocation

class MyLocationVC: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    var locationObj = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationObj.requestWhenInUseAuthorization()
        locationObj.startUpdatingLocation()
        locationObj.delegate = self
    }
    
}

extension MyLocationVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        locationObj.delegate = nil
        
        if locations.count > 0 {
            //mapView.setCenter(locations[0].coordinate, animated: true)
            let span = MKCoordinateSpan(latitudeDelta: 0.050, longitudeDelta: 0.050)
            let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
            mapView.setRegion(region, animated: true)

        }
    }
}
