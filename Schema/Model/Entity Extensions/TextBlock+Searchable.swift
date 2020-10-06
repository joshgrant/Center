//
//  TextBlock+Searchable.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension TextBlock: Searchable
{
    public static func predicate(for queryString: String) -> NSPredicate
    {
        makeContentPredicate(queryString)
    }
    
    private static func makeContentPredicate(_ queryString: String) -> NSPredicate
    {
        NSPredicate(format: "content CONTAINS[cd] %@", queryString)
    }
}
