//
//  History.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(History)
public class History: BaseObject
{
    public override class func entity() -> NSEntityDescription
    {
        CoreDataEntityManager.historyEntity
    }
}
