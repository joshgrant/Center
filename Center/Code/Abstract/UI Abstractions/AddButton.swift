//
//  AddButton.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit

func makeListAddButton(actionClosure: ActionClosure) -> UIBarButtonItem
{
    let button = UIBarButtonItem(systemItem: .add)
    button.target = actionClosure // weak reference
    button.action = #selector(actionClosure.perform(sender:))
    return button
}
