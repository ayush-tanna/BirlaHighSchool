//
//  icalViewController.swift
//  
//
//  Created by Ayush Tanna on 06/07/17.
//
//

import UIKit

class icalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didDownLink(sender: AnyObject) {
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/birla-high-school.appspot.com/o/BHS_Calendar.ics?alt=media&token=524cbd08-f5c3-4d0d-8fe9-009b65b09428")!
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
