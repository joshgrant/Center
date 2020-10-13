//
//  Database+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import CoreData

func performFetchRequest<T>(fetchRequest: NSFetchRequest<T>, context: Context) -> [T]
{
    do {
        let result = try context.fetch(fetchRequest)
        return result
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}
