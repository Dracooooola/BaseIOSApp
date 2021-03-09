//
//  MapViewController.swift
//  BaseIOSApp
//
//  Created by Владислав Климов on 09.03.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constants {
        static let latitude = 25.04082
        static let longitude = -77.37122
    }
    
    // MARK: - IBActions
    
    @IBAction func openMapButtonPressed(_ sender: UIButton) {
        openMap()
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Private Methods

private extension MapViewController {
    
    func openMap() {
        let coordinate = CLLocationCoordinate2DMake(Constants.latitude, Constants.longitude)
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Багамы"
        mapItem.openInMaps(launchOptions: [:])
    }
    
}
