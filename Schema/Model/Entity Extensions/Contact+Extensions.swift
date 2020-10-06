//
//  Contact+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Contact: Searchable
{
    public static func predicate(for queryString: String) -> NSPredicate
    {
        let predicates = [
            makeNamePredicate(queryString),
            makePhoneNumberPredicate(queryString),
            makeEmailPredicate(queryString)]
            .compactMap { $0 }
        
        return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
    }
    
    private static func makeNamePredicate(_ queryString: String) -> NSPredicate?
    {
        NSPredicate(format: "name CONTAINS[cd] %@", queryString)
    }
    
    private static func makePhoneNumberPredicate(_ queryString: String) -> NSPredicate?
    {
        NSPredicate(format: "phone CONTAINS[cd] %@", queryString)
    }
    
    private static func makeEmailPredicate(_ queryString: String) -> NSPredicate?
    {
        NSPredicate(format: "email CONTAINS[cd] %@", queryString)
    }
}
