//
//  TabBarController.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class TabBarController: UITabBarController
{
    var _delegate: TabBarControllerDelegate!
    
    public init(delegate: TabBarControllerDelegate)
    {
        _delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = _delegate
    }
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder)
    {
        fatalError("Load this view programmatically")
    }
}
