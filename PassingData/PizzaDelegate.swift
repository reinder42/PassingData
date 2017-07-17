//
//  PizzaProtocol.swift
//  PassingData
//
//  Created by Reinder de Vries on 15/07/2017.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import Foundation

// Note: this protocol is used in "Passing Data Back With Delegation"

protocol PizzaDelegate
{
    func onPizzaReady(type: String)
}
