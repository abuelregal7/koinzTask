//
//  ShowImageViewController.swift
//  KoinzTask
//
//  Created by Ahmed on 5/20/22.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var fullPhotoOutlet: UIImageView!
    
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullPhotoOutlet.loadImage(imageURL)
        
    }
    
    
    
}
