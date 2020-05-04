//
//  SpicesListViewController.swift
//  SpiceML
//
//  Created by Felipe Girardi on 29/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import UIKit

class SpicesListViewController: UIViewController {
    
    @IBOutlet weak var spicesListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spicesListTableView.delegate = self
        spicesListTableView.dataSource = self
    }
    
}

extension SpicesListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "spicesListCell") as? SpicesListTableViewCell else { fatalError("Error loading TableViewCell") }
        
        cell.mainBackground.layer.cornerRadius = 16
        cell.mainBackground.layer.masksToBounds = true

        cell.shadowLayer.layer.masksToBounds = false
        cell.shadowLayer.layer.cornerRadius = 16
        cell.shadowLayer.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.shadowLayer.layer.shadowColor = UIColor.black.cgColor
        cell.shadowLayer.layer.shadowOpacity = 0.23
        cell.shadowLayer.layer.shadowRadius = 4
        
        cell.spiceListImage.image = UIImage(systemName: "manjericao")
        cell.spiceLabel.text = "Manjericão"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        headerView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: view.frame.size.width/4, y: 7, width: view.frame.size.width, height: 40))
        label.text = "Temperos"
        label.textColor = .black
        label.font = label.font.withSize(40)
        headerView.addSubview(label)

        return headerView
    }

}
