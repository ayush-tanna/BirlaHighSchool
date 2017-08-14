//
//  noticeTableViewController.swift
//  BirlaHighSchool
//
//  Created by Ayush Tanna on 06/04/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class noticeTableViewController: UITableViewController {
    
    let cellId = "cellId"
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
    }
    
    func fetchUser() {
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as?[String: AnyObject] {
                let user = User()
                user.setValuesForKeys(dictionary)
                
                self.users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
            
        }, withCancel: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let user = users[indexPath.row]
        
        //cell.textLabel?.text = user.email
        //cell.textLabel?.text = user.suggestion
        
        return cell
        
    }
}
