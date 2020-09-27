//
//  Flow.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(Flow)
public class Flow: BaseObject
{
    public override class func entity() -> NSEntityDescription
    {
        CoreDataEntityManager.flowEntity
    }
}
