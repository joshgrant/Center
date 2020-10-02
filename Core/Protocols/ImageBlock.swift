//
//  ImageBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol ImageBlock: Block
{
    var image: Data? { get set }
    var caption: String? { get set }
}
