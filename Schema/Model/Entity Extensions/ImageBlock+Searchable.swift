//
//  ImageBlock+Searchable.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension ImageBlock: Searchable
{
    public static func predicate(for queryString: String) -> NSPredicate
    {
        makeCaptionPredicate(queryString)
    }
    
    private static func makeCaptionPredicate(_ queryString: String) -> NSPredicate
    {
        NSPredicate(format: "content CONTAINS[cd] %@", queryString)
    }
}
