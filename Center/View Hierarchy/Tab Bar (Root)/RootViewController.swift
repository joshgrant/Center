//
//  RootViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class RootViewController: TabBarController
{
    var viewFactory: RootViewFactoryProtocol
    
    init(viewFactory: RootViewFactoryProtocol)
    {
        self.viewFactory = viewFactory
        
        super.init()
        
        viewControllers = viewFactory.makeAllViewControllers()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
