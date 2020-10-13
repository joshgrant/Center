//
//  UIImage+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public extension UIImage
{
    convenience init?(icon: Icon) {
        self.init(systemName: icon.rawValue)
    }
}
