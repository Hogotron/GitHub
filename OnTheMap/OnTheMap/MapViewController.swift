//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/10/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//


import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: -- Properties
    var appDelegate: AppDelegate!
    
    //MARK: -- Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}