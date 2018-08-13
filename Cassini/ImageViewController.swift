//
//  ImageViewController.swift
//  Cassini
//
//  Created by Michael Dardis on 8/13/18.
//  Copyright © 2018 Michael Dardis. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    //this is my model
    var imageURL: URL? {
        didSet{
            imageView.image = nil
            if view.window != nil { //am I on screen? if so, then fetch image
                fetchImage()
            }
        }
    }
    
    //at this point, I know I'm on screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url) //return nil if fails
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
    
}















