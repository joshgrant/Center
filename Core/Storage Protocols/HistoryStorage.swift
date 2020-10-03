//
//  HistoryStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol HistoryStorage
{
    func history() -> [History]
    func append(history: History) throws
    func history(from: Date, to: Date) throws -> [History]
}
