//
//  Identified.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Entity
{
    var id: UUID { get }
}
