//
//  SettingsViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class SettingsViewController: ViewController
{
    init(viewFactory: SettingsViewFactoryProtocol)
    {
        super.init()
        self.tabBarItem = viewFactory.makeTabBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
