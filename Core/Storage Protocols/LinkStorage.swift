//
//  LinkStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol LinkStorage
{
    func links() -> [Entity]
    func append(link: Entity) throws
    func remove(link: Entity) throws
}
