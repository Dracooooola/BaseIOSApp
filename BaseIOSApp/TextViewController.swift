//
//  TextViewController.swift
//  BaseIOSApp
//
//  Created by Владислав Климов on 09.03.2021.
//

import UIKit

class TextViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var textLabel: UILabel!
    
    // MARK: - Properties
    
    var text: String = "Default text"
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
    }

}
