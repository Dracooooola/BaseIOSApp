//
//  ViewController.swift
//  BaseIOSApp
//
//  Created by Владислав Климов on 08.03.2021.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: - IBActions
    
    @IBAction private func presentTextVCButtonPressed(_ sender: UIButton) {
        presentTextViewController()
    }
    
    @IBAction func pushMapVCButtonPressed(_ sender: UIButton) {
        pushMapViewController()
    }
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TextViewController,
           segue.identifier == "PresentTextVC",
           let text = textField.text {
            vc.text = text
        }
    }
    
}

// MARK: - Private Methods

private extension MainViewController {
    
    func presentTextViewController() {
        guard let text = textField.text, !text.isEmpty else {
            return
        }

        performSegue(withIdentifier: "PresentTextVC", sender: nil)
    }
    
    func pushMapViewController() {
        guard let vc = storyboard?.instantiateViewController(identifier: String(describing: MapViewController.self)) else {
            return
        }
        
        show(vc, sender: nil)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}
