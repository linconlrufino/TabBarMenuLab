//
//  PlanetController.swift
//  TabBarMenuLab
//
//  Created by Linconl Rufino on 24/09/23.
//

import UIKit

class PlanetController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var planetName: String?
    
    override func viewDidLoad() {
        if let name = self.planetName {
            let firstLast = name.components(separatedBy: " ")
            nameTextField.text = firstLast.first
        }
        
        super.viewDidLoad()
    }
        // Do any additional setup after loading the view.
    
}
