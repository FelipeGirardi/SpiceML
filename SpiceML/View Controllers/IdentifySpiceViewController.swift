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
    @IBOutlet weak var spiceNameLabel: UILabel!
    @IBOutlet weak var titleBackgroundView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var howToConsumeTextView: UITextView!
    @IBOutlet weak var howToConsumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        spiceImage.image = selectedImage
        spiceNameLabel.text = classLabel?.uppercased()
        
        titleBackgroundView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        
        howToConsumeLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        descriptionTextView.sizeToFit()
        howToConsumeTextView.sizeToFit()
        
        
    }

}

extension UIView {

    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
