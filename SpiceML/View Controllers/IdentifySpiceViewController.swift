//
//  IdentifySpiceViewController.swift
//  SpiceML
//
//  Created by Felipe Girardi on 29/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import UIKit

class IdentifySpiceViewController: UIViewController {
    
    var selectedImage: UIImage?
    var classLabel: String?
    var classProbability: Double?
    
    @IBOutlet weak var spiceImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spiceImage.image = selectedImage
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

}
