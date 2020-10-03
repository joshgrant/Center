//
//  Contact.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

// TODO: Link to contact card in iOS

@objc public protocol Contact: Entity
{
    var name: String? { get set }
    var phoneNumber: String? { get set }
    var email: String? { get set }
}
