//
//  webViewController.swift
//  BirlaHighSchool
//
//  Created by Ayush Tanna on 27/03/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit

class webViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://birlahighschool.com/boys/sites/birlahighschool.com.boys/files/Revised%20Admission%20Test%20Syllabus_1.pdf");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
    
    }
}
