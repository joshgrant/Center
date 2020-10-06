//
//  TextBlock+Searchable.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension TextBlock
{
    var textStyleType: TextStyle {
        get {
            TextStyle(rawValue: textStyleTypeRaw) ?? .fallback
        }
        set {
            textStyleTypeRaw = newValue.rawValue
        }
    }
    
    var textSizeType: TextSize {
        get {
            TextSize(rawValue: textSizeTypeRaw) ?? .fallback
        }
        set {
            textSizeTypeRaw = newValue.rawValue
        }
    }
}

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
