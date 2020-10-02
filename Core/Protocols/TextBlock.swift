//
//  TextBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol TextBlock: Block
{
    var textSize: TextSize { get set }
    var textStyle: TextStyle { get set }
}
