//
//  Stock.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class Stock: Object, StockProtocol
{
    @objc dynamic var value = 0.0
    @objc dynamic var symbol: Symbol!
    @objc dynamic var history: History!
}

/*
 
 class Stock: NSManagedObject, StockProtocol
 {
    @NSManaged var value = 0.0
    @NSManaged var symbol: Symbol!
    @NSManaged var history: History!
 }
 
 */
