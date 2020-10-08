//
//  LibraryListCellModelFactory.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema

open class LibraryListCellModelFactory: NSObject
{
    var database: Database
    
    init(database: Database) throws
    {
        self.database = database
    }
    
    // TODO: Protocol conformance?
    func makeCellModels() -> [[TableViewCellModel]]
    {
        do {
            return [try libraryListCellModels(context: database.context)]
        } catch {
            assertionFailure(error.localizedDescription)
            return []
        }
    }
    
    private func libraryListCellModels(context: Context) throws -> [LibraryListCellModel]
    {
        try EntityType.allCases.map {
            try libraryListCellModel(for: $0, context: context)
        }
    }
    
    private func libraryListCellModel(for entityType: EntityType, context: Context) throws -> LibraryListCellModel
    {
        LibraryListCellModel(
            image: imageForEntityType(entityType),
            title: titleForEntityType(entityType),
            count: try countForEntityType(entityType, context: context))
    }
}
