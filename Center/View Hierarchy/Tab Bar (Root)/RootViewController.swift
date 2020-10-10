//
//  RootViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class RootViewController: TabBarController
{
    override init()
    {
        super.init()
        viewControllers = makeTabBarControllers()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
