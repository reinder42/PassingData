//
//  ViewController.swift
//  PassingData
//
//  Created by Reinder de Vries on 15/07/2017.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, PizzaDelegate
{
    /// The notification name you want to observe and post
    static let notificationName = Notification.Name("myNotificationName")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Observe for the notification, and define the function that's called when the notification is received
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: MainViewController.notificationName, object: nil)
    }
    
    /**
         This function is called when you press button A in this view controller
    */
    @IBAction func onButtonTap()
    {
        // Create the view controller
        let vc = SecondaryViewController(nibName: "SecondaryViewController", bundle: nil)
        
        // Set the text property, for "Passing Data Forward With Properties (A → B)"
        vc.text = "Next level blog photo booth, tousled authentic tote bag kogi"
        
        // Set the tightly-coupled property for "Passing Data Back With A Property"
        vc.mainViewController = self
        
        // Set the delegate for "Passing Data Back With Delegation"
        vc.delegate = self
        
        // Define the closure for "Passing Data Back With A Closure"
        vc.completionHandler = { text in
            
            print("text = \(text)")
            
            return text.characters.count
        }
        
        // Push the view controller onto the navigation stack
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /**
          This segue is invoked when you press button B in this view controller
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Determine what the segue destination is
        if segue.destination is TertiaryViewController
        {
            let vc = segue.destination as? TertiaryViewController
            vc?.username = "Arthur Dent"
        }
    }
    
    /**
         This function is invoked from the secondary view controller class,
         for "Passing Data Back With A Property"
    */
    func onUserAction(data: String)
    {
        print("Data received: \(data)")
    }
    
    /**
         This function is invoked from the secondary view controller class,
         as a delegate function, for "Passing Data Back With Delegation"
    */
    func onPizzaReady(type: String)
    {
        print("Pizza ready. The best pizza of all pizzas is... \(type)")
    }
    
    /**
         This function is invoked when the notification is received,
         for "Passing Data With NSNotificationCenter"
    */
    @objc func onNotification(notification:Notification)
    {
        // `userInfo` contains the data you sent along with the notification
        
        print(notification.userInfo)
    }
}

