//
//  ImageSendViewController.swift
//  BaseIOSApp
//
//  Created by Владислав Климов on 09.03.2021.
//

import UIKit

class ImageSendViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Private Properties
    
    var image: UIImage?
    
    // MARK: - IBActions
    
    @IBAction func shareImageButtonPressed(_ sender: UIButton) {
        shareImage()
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
}

// MARK: - Private Methods

private extension ImageSendViewController {
    
    func configureAppearance() {
        guard let image = UIImage(named: "demoImage") else {
            return
        }
        
        self.image = image
        imageView.image = image
    }
    
    func shareImage() {
        guard let image = self.image else {
            return
        }
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
