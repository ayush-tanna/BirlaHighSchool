//
//  suggestionsViewController.swift
//  BirlaHighSchool
//
//  Created by Ayush Tanna on 04/04/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class suggestionsViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var info: UITextView!
    var ref : FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signupButtonTapped(_ sender: AnyObject) {
        let providedEmailAddress = emailAddressTextField.text
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
        } else {
            print("Email address is not valid")
            displayAlertMessage(messageToDisplay: "Email address is not valid")
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func log(_ sender: Any) {
        
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let uid = user?.uid else {
                return
            }
            
            let email = self.emailAddressTextField.text!
            let suggest = self.info.text!
            
            self.emailAddressTextField.text = ""
            self.info.text = ""
            
            self.ref = FIRDatabase.database().reference()
            let usersReference = self.ref?.child("users").child(uid)
            let values = ["email":email, "suggestion":suggest]
            usersReference?.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    print(err!)
                    return
                }
                
                print ("saved user succesfully in db")
            })
}
}
}
