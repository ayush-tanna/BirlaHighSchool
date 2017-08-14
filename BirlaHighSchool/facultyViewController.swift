//
//  facultyViewController.swift
//  BirlaHighSchool
//
//  Created by Ayush Tanna on 02/04/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit

class facultyViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://birlahighschool.com/boys/content/our-faculty");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
