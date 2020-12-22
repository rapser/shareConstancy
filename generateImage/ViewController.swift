//
//  ViewController.swift
//  generateImage
//
//  Created by miguel tomairo on 11/3/20.
//  Copyright © 2020 miguel tomairo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constancia: UIView!
    
    var imageToShare: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageToShare = UIImage()
        imageToShare =  constancia.asImage()
        
    }

    @IBAction func constanciaTapped(_ sender: Any) {
        
        let image = imageToShare

        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        self.present(activityViewController, animated: true, completion: nil)
        
    }
}

extension UIView {

    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
