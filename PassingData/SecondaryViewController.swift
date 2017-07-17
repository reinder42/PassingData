//
//  SecondaryViewController.swift
//  PassingData
//
//  Created by Reinder de Vries on 15/07/2017.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit

class SecondaryViewController: UIViewController
{
    /// The text property for "Passing data forward with properties"
    var text:String = ""
    
    /// The view controller property for "Passing data back with properties"
    var mainViewController:MainViewController?
    
    /// The delegate property for "Passing data back with delegation"
    var delegate:PizzaDelegate?
    
    /// Closure property for "Passing Data Back With A Closure"
    var completionHandler:((String) -> Int)?
    
    /// The text label for on-screen text for "Passing data forward with properties"
    @IBOutlet weak var textLabel:UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set the text on the label
        textLabel?.text = text
    }
    
    /**
         This function is called when you tap the button on this view controller
    */
    @IBAction func onButtonTap()
    {
        // Call the tightly-coupled onUserAction(data:) function for "Passing data back with properties"
        mainViewController?.onUserAction(data: "The quick brown fox jumps over the lazy dog")
        
        // Call the loosely-coupled delegation function for "Passing data back with delegation"
        delegate?.onPizzaReady(type: "Pizza di Mama")
        
        // Call the closure for "Passing Data Back With A Closure" and print its result
        let result = completionHandler?("FUS-ROH-DAH!!!")
        
        print("completionHandler returns... \(result)")
    }
}
