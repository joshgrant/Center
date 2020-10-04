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
    
    public var linkedStocks = LinkingObjects(fromType: RStock.self, property: "dimension")
}

// MARK: - Unit storage

public extension RDimension
{
    func units() -> [Unit]
    {
        _units.map { $0 as Unit }
    }
    
    func append(unit: Unit) throws
    {
        let unit: RUnit = try unit.unwrap()
        try realm?.write {
            _units.append(unit)
        }
    }
    
    func remove(unit: Unit) throws
    {
        let unit: RUnit = try unit.unwrap()
        try realm?.write {
            try _units.remove(object: unit)
        }
    }
}
