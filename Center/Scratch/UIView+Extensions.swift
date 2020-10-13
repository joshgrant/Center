//
//  UIView+Extensions.swift
//  Architecture
//
//  Created by Joshua Grant on 9/28/20.
//

import UIKit

public extension UIView
{
    typealias Constraint = NSLayoutConstraint
    typealias Constraints = (top: Constraint, right: Constraint, bottom: Constraint, left: Constraint)
    
    // TODO: This is really 3 methods:
    // 1. Creating the constraints
    // 2. Assigning the priority
    // 3. Activating the constraints and embedding the view
    @discardableResult func embed(_ view: UIView, padding: UIEdgeInsets = .zero, bottomPriority: UILayoutPriority = .required) -> Constraints
    {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        let top = view.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        let right = trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding.right)
        let bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding.bottom)
        let leading = view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        
        bottom.priority = bottomPriority
        
        NSLayoutConstraint.activate([top, right, bottom, leading])
        
        return (top, right, bottom, leading)
    }
}
