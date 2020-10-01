//
//  Stock.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class Stock: Object
{
    @objc dynamic var value = 0.0
    
    @objc dynamic var symbol: Symbol!
    @objc dynamic var history: History!
}
