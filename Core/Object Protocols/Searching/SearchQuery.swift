//
//  SearchQuery.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation

@objc public protocol SearchQuery
{
    var queryString: String { get set }
    
    var allowedClassNames: [String] { get set }
    
    func conditions() -> [Condition]
    func append(condition: Condition) throws
    func remove(condition: Condition) throws
}
