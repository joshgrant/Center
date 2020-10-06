//
//  RSearchResult.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation
import RealmSwift

public struct RSearchResult: SearchResult
{
    public typealias T = REntity
    
    public var results: [T]
    
    init(results: Results<T>)
    {
        self.results = results.map { $0 }
    }
}
