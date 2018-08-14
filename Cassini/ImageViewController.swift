//
//  ImageViewController.swift
//  Cassini
//
//  Created by Michael Dardis on 8/13/18.
//  Copyright © 2018 Michael Dardis. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    //this is my model
    var imageURL: URL? {
        didSet{
            image = nil
            if view.window != nil { //am I on screen? if so, then fetch image
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? { //computed var to set the image of imageView
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit() //everytime image changes, we reset the scrollview size
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    //at this point, I know I'm on screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0 //maybe I dont want you to zoom in
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageView = UIImageView()
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url) //return nil if fails
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
    }
    
    
}















