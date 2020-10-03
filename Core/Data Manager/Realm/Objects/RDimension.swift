//
//  RDimension.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RDimension: Object, Dimension
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    
    public let _units = List<RUnit>()
}

// MARK: - Unit storage

extension RDimension
{
    public func units() -> [Unit]
    {
        _units.map { $0 as Unit }
    }
    
    public func append(unit: Unit) throws
    {
        
    }
    
    public func remove(unit: Unit) throws
    {
        
    }
}
