//
//  Flow.swift
//  Center
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class Flow: Object, Codable
{
    @objc dynamic var symbol: Symbol!
    @objc dynamic var history: History!
}
