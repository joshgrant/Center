//
//  UIBarButtonItem+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 6/3/21.
//

import UIKit

extension UIBarButtonItem
{
    convenience init(systemItem: UIBarButtonItem.SystemItem, actionClosure: ActionClosure)
    {
        self.init(systemItem: systemItem)
        self.target = actionClosure
        self.action = #selector(actionClosure.perform(sender:))
    }
}
