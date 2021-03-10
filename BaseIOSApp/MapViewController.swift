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
//        openMap()
        openMaps(latitude: Constants.latitude, longitude:  Constants.longitude, title: "Багамы")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Private Methods

private extension MapViewController {
    
    // Дефолтное открытие карт из MapKit
    func openMap() {
        let coordinate = CLLocationCoordinate2DMake(Constants.latitude, Constants.longitude)
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Багамы"
        mapItem.openInMaps(launchOptions: [:])
    }
    
    // Открытие по ссылке через алерт
    func openMaps(latitude: Double, longitude: Double, title: String?) {
        let application = UIApplication.shared
        let coordinate = "\(latitude),\(longitude)"
        let coordinateForYandexMap = "\(longitude),\(latitude)"
        let encodedTitle = title?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let handlers = [
            ("Yandex Maps", "yandexmaps://maps.yandex.ru/?&ll=\(coordinateForYandexMap)&z=\(10)&pt=\(coordinateForYandexMap)"),
            ("Apple Maps", "http://maps.apple.com/?q=\(encodedTitle)&ll=\(coordinate)"),
            ("Google Maps", "comgooglemaps://?q=\(coordinate)")
        ]
            .compactMap { (name, address) in URL(string: address).map { (name, $0) } }
            .filter { (_, url) in application.canOpenURL(url) }

        guard handlers.count > 1 else {
            if let (_, url) = handlers.first {
                application.open(url, options: [:])
            }
            return
        }
        let alert = UIAlertController(title: "Выберите приложение для просмотра карт", message: nil, preferredStyle: .actionSheet)
        handlers.forEach { (name, url) in
            alert.addAction(UIAlertAction(title: name, style: .default) { _ in
                application.open(url, options: [:])
            })
        }
        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
