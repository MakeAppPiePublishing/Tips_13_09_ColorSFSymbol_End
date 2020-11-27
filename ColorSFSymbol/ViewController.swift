//
//  ViewController.swift
//  ColorSFSymbol
//
//  Created by Steven Lipton on 11/15/20.
//

import UIKit

class ViewController: UIViewController {

    var isRaining:Bool = false
    var isTemplate:Bool = true
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var modeButton: UIButton!
    
    @IBAction func imageToggle(_ sender: Any) {
        var rain = UIImage()
        isRaining.toggle()
        if isRaining{
            rain = UIImage(systemName:"cloud.sun.rain.fill")!
        } else {
            rain = UIImage(systemName:"cloud.sun.fill")!
        }
        imageView.image = rain
        modeButton.setImage(rain, for: .normal)
        imageButton.setImage(rain, for: .normal)
    }
    
    
    @IBAction func modeToggle(_ sender: Any) {
        isTemplate.toggle()
        var newImage = imageView.image
        newImage = newImage?.withRenderingMode(isTemplate ? .alwaysTemplate : .alwaysOriginal)
        imageView.image = newImage
        modeButton.setImage(newImage, for: .normal)
        imageButton.setImage(newImage, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(systemName:"cloud.sun.fill")!
        imageButton.layer.cornerRadius = 10.0
        modeButton.layer.cornerRadius = 10.0
        modeButton.setImage(imageButton.image(for: .normal), for: .normal)
    }


}

