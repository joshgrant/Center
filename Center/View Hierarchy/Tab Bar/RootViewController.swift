//
//  RootViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class RootViewController: TabBarController
{
    init(viewFactory: RootViewFactoryProtocol)
    {
        super.init()
        viewControllers = viewFactory.makeAllViewControllers()
    }
    
    /// Create a custom root view and assign it here...
    //override func loadView() {
    //}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
