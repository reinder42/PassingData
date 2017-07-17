//
//  TertiaryViewController.swift
//  PassingData
//
//  Created by Reinder de Vries on 15/07/2017.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit

class TertiaryViewController: UIViewController
{
    // Note: this class is used in section "Passing Data Forward using Segues (A → B)"
    
    /// The username property that goes into the label
    var username:String = ""
    
    /// The label property
    @IBOutlet weak var usernameLabel:UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set the label text
        usernameLabel?.text = username
    }
    
    @IBAction func onButtonTap()
    {
        // Post the notification when the button is tapped, and send along some data
        
        NotificationCenter.default.post(name: MainViewController.notificationName, object: nil, userInfo:["data": 42, "isImportant": true])
    }
}
