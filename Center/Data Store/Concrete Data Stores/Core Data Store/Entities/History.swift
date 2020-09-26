//
//  History.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class History: NSManagedObject
{
    
}

extension History: EntityConstructionProtocol
{
    static var entity: NSEntityDescription
    {
        let entity = NSEntityDescription()
        entity.name = String(describing: self)
        
        entity.properties = []
        
        return entity
    }
}
