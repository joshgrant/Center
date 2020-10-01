//
//  Condition.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(Condition)
public class Condition: NSManagedObject
{
    public override class func entity() -> NSEntityDescription
    {
        return CoreDataEntityManager.conditionEntity
    }
}
