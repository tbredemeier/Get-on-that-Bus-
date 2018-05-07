//
//  DetailViewController.swift
//  Get on that Bus!
//
//  Created by tbredemeier on 5/6/18.
//  Copyright © 2018 tbredemeier. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var routesLabel: UILabel!

    let locationManager = CLLocationManager()
    var selectedAnnotation = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mapView.addAnnotation(selectedAnnotation)
        nameLabel.text = "Stop: \(selectedAnnotation.title!)"
        routesLabel.text = selectedAnnotation.subtitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.mapView.showAnnotations(mapView.annotations, animated: true)
        locationManager.stopUpdatingLocation()
    }
}
