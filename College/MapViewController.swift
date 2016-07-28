//
//  MapViewController.swift
//  College
//
//  Created by Zachary Rutherford on 7/28/16.
//  Copyright © 2016 Zachary Rutherford. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var college = CollegeClass()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = CLLocationCoordinate2DMake(41.8938, -87.6354)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        displayMap(center, span: span, pinTitle: "Mobile Makers Academy")
        textField.text = "\(college.location)"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(textField.text!, completionHandler: {placemarks, error in
            if error != nil {
                print (error)
            }
                
            else {
                let placemark = placemarks!.first as CLPlacemark!
                let center = placemark.location!.coordinate
                let span = MKCoordinateSpanMake(0.1, 0.1)
                self.displayMap(center, span: span, pinTitle: textField.text!)
            }
        })
        return true
    }
    
    func displayMap(center: CLLocationCoordinate2D, span: MKCoordinateSpan, pinTitle: String){
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = pinTitle
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }



}
