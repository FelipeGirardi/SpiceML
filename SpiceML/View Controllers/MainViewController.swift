//
//  MainViewController.swift
//  SpiceML
//
//  Created by Felipe Girardi on 29/04/20.
//  Copyright © 2020 Felipe Girardi. All rights reserved.
//

import UIKit
import CoreML

class MainViewController: UIViewController {
    
    var spicesModel: Spices_1?
    var selectedImage: UIImage?
    var classLabel: String?
    var classProbability: Double?
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var seeCatalogueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        spicesModel = Spices_1()
    }
    
    func setButtons() {
        selectImageButton.titleLabel?.textColor = UIColor(red: 69/255, green: 94/255, blue: 73/255, alpha: 1.0)
        selectImageButton.backgroundColor = .white
        selectImageButton.layer.cornerRadius = 25
        selectImageButton.layer.borderWidth = 3
        selectImageButton.layer.borderColor = CGColor(srgbRed: 115/255, green: 143/255, blue: 120/255, alpha: 1.0)
        selectImageButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        selectImageButton.layer.shadowColor = UIColor(red: 115/255, green: 143/255, blue: 120/255, alpha: 0.28).cgColor
        selectImageButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        selectImageButton.layer.shadowOpacity = 1.0
        selectImageButton.layer.shadowRadius = 2.0
        selectImageButton.layer.masksToBounds = false
        
        seeCatalogueButton.titleLabel?.textColor = UIColor(red: 69/255, green: 94/255, blue: 73/255, alpha: 1.0)
        seeCatalogueButton.backgroundColor = .white
        seeCatalogueButton.layer.cornerRadius = 25
        seeCatalogueButton.layer.borderWidth = 3
        seeCatalogueButton.layer.borderColor = CGColor(srgbRed: 115/255, green: 143/255, blue: 120/255, alpha: 1.0)
        seeCatalogueButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        seeCatalogueButton.layer.shadowColor = UIColor(red: 115/255, green: 143/255, blue: 120/255, alpha: 0.28).cgColor
        seeCatalogueButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        seeCatalogueButton.layer.shadowOpacity = 1.0
        seeCatalogueButton.layer.shadowRadius = 2.0
        seeCatalogueButton.layer.masksToBounds = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToIdentifySpice") {
            guard let identifySpiceVC = segue.destination as? IdentifySpiceViewController else { fatalError("Destination controller IdentifySpice not found") }
            identifySpiceVC.selectedImage = selectedImage
            identifySpiceVC.classLabel = classLabel
            identifySpiceVC.classProbability = classProbability
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
        
        // Transform pickedImage to 299x299 size
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 299, height: 299), true, 2.0)
        pickedImage.draw(in: CGRect(x: 0, y: 0, width: 299, height: 299))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(newImage.size.width), Int(newImage.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return
        }
        
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(newImage.size.width), height: Int(newImage.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) //3
        
        context?.translateBy(x: 0, y: newImage.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        newImage.draw(in: CGRect(x: 0, y: 0, width: newImage.size.width, height: newImage.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        
        selectedImage = newImage
        
        // Use model to make prediction
        guard let prediction = try? spicesModel?.prediction(image: pixelBuffer!) else {
            return
        }
        
        classLabel = prediction.classLabel
        classProbability = prediction.classLabelProbs[classLabel ?? ""]
        
        picker.dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "goToIdentifySpice", sender: nil)
        })
        
    }
}


