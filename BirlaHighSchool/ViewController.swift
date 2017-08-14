//
//  ViewController.swift
//  BirlaHighSchool
//
//  Created by Ayush Tanna on 25/03/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        mainScrollView.frame = view.frame
        
        imageArray = [#imageLiteral(resourceName: "Untitled-1-1") ,#imageLiteral(resourceName: "Untitled-2-1")]
        
        for i in 0..<imageArray.count{
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i + 1)
            mainScrollView.addSubview(imageView)
            
        }
    }
    
}

