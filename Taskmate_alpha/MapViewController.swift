//
//  MapViewController.swift
//  Taskmate_alpha
//
//  Created by Daniel Tse on 15/11/2014.
//  Copyright (c) 2014 Daniel Tse. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    @IBOutlet var mView: CustomView!
    
    @IBOutlet var appleMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var camera = GMSCameraPosition.cameraWithLatitude(-33.868,
            longitude:151.2086, zoom:16)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        mapView.settings.myLocationButton = true
        mapView.settings.zoomGestures = true
        mapView.myLocationEnabled = true
        mapView.accessibilityElementsHidden = false
        
        
        var marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.draggable = true
        marker.map = mapView
//        self.view = mapView
        
        
        let location = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: appleMap.userLocation.coordinate,
            span: span)
        
        appleMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        
        appleMap.addAnnotation(annotation)
        
        
    }
    
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
