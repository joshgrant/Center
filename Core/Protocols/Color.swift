//
//  Color.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Color
{
    var hue: Double { get set }
    var saturation: Double { get set }
    var brightness: Double { get set }
}
