//
//  MainViewController.swift
//  SpiceML
//
//  Created by Felipe Girardi on 29/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var selectedImage: UIImage?
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var seeCatalogueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtons()
    }
    
    func setButtons() {
        selectImageButton.titleLabel?.textColor = UIColor(red: 69/255, green: 94/255, blue: 73/255, alpha: 1.0)
        selectImageButton.backgroundColor = .clear
        selectImageButton.layer.cornerRadius = 25
        selectImageButton.layer.borderWidth = 3
        selectImageButton.layer.borderColor = CGColor(srgbRed: 115/255, green: 143/255, blue: 120/255, alpha: 1.0)
        selectImageButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        seeCatalogueButton.titleLabel?.textColor = UIColor(red: 69/255, green: 94/255, blue: 73/255, alpha: 1.0)
        seeCatalogueButton.backgroundColor = .clear
        seeCatalogueButton.layer.cornerRadius = 25
        seeCatalogueButton.layer.borderWidth = 3
        seeCatalogueButton.layer.borderColor = CGColor(srgbRed: 115/255, green: 143/255, blue: 120/255, alpha: 1.0)
        seeCatalogueButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToIdentifySpice") {
            guard let identifySpiceVC = segue.destination as? IdentifySpiceViewController else { fatalError("Destination controller IdentifySpice not found") }
            identifySpiceVC.selectedImage = self.selectedImage
        }
    }
    
    @IBAction func seeCatalogueAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSpicesList", sender: sender)
    }
    
    @IBAction func selectImageAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Escolher imagem", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Galeria de imagens", style: .default, handler: { _ in
            self.openGallery()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancelar", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Aviso", message: "Você não possui uma câmera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
     func openGallery() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Aviso", message: "Você não tem permissão para acessar a galeria de imagens", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else { fatalError("Image error") }
            self.selectedImage = pickedImage
            picker.dismiss(animated: true, completion: {
                self.performSegue(withIdentifier: "goToIdentifySpice", sender: nil)
            })
    }
}


