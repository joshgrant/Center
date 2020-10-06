//
//  Search.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation

@objc public protocol Search
{
    func search(query: SearchQuery) -> SearchResult
}
