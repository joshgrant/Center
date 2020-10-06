//
//  SearchResult.swift
//  Core
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

public protocol SearchResult
{
    associatedtype T
    
    var results: [T] { get set }
}
