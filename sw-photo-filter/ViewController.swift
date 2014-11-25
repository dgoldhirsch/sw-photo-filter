//
//  ViewController.swift
//  sw-photo-filter
//
//  Created by David Goldhirsch on 11/22/14.
//  Copyright (c) 2014 David Goldhirsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        // Create image to filter
        let inputImage = CIImage(image: pictureView.image)
        
        // Create random color
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply filter
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Render filtered image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        // Update UI
        pictureView.image = UIImage(CGImage: renderedImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

