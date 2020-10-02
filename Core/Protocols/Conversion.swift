//
//  Conversion.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc protocol Conversion
{
    var from: Symbol { get set }
    var to: Symbol { get set }
    var ratio: Ratio { get set }
    var isReversible: Bool { get set }
}
