//
//  EventStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol EventStorage
{
    func events() -> [Event]
    func append(event: Event) throws
    func remove(event: Event) throws
}
