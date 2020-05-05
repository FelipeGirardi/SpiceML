//
//  SpicesListTableViewCell.swift
//  SpiceML
//
//  Created by Felipe Girardi on 30/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import UIKit

class SpicesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var spiceListImage: UIImageView!
    @IBOutlet weak var spiceLabel: UILabel!
    @IBOutlet weak var mainBackground: UIView!
    @IBOutlet weak var shadowLayer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
