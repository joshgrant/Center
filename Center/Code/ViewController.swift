//
//  ViewController.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

// TODO: Add a method: `viewDidForeground` which is called when the app
// enters the foreground, as well as `viewDidBackground` and the `will` parts if applicable
// Use an observer

open class ViewController: UIViewController
{
    var actionClosures: Set<ActionClosure> = []
    
    public init()
    {
        super.init(nibName: nil, bundle: nil)
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
