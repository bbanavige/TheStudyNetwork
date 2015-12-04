//
//  mapViewController.swift
//  Map
//
//  Created by Ben Banavige on 12/3/15.
//  Copyright © 2015 thestudynetwork. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapHarvard()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mapHarvard()
    {
        // Harvard coordinates
        let harvLat:CLLocationDegrees = 42.3745
        let harvLong:CLLocationDegrees = -71.1172
        
        let harvCoordinate = CLLocationCoordinate2D(latitude: harvLat, longitude: harvLong)
        
        // Span of map
    
        let harvSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let harvRegion = MKCoordinateRegion(center: harvCoordinate, span: harvSpan)
        
        myMapView.setRegion(harvRegion, animated: true)
        
        let harvAnnotation = MKPointAnnotation()
        harvAnnotation.title = "Welcome to Harvard's Study Network"
        harvAnnotation.subtitle = "People studying near you"
        harvAnnotation.coordinate = harvCoordinate
        
        
        myMapView.addAnnotation(harvAnnotation)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
