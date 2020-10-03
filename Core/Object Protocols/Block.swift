//
//  Block.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Block: Entity
{
    var url: URL? { get set }
    var mainColor: Color? { get set }
    var tintColor: Color? { get set }
    var backgroundColor: Color? { get set }
    
    func relatedNotes() -> [Note]
}
