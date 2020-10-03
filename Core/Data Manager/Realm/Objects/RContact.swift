//
//  RContact.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RContact: Object, Contact
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var symbol: Symbol?
    @objc dynamic public var name: String?
    @objc dynamic public var phoneNumber: String?
    @objc dynamic public var email: String?
    
    public let _notes = List<RNote>()
}