//
//  NavigationController.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class NavigationController: UINavigationController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Load this view programmatically")
    }
}
