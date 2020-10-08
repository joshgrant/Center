//
//  LibraryListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import UIKit
import Schema

struct LibraryListCellModel
{
    var image: UIImage?
    var title: String
    var count: Int
}

func libraryListCellModels(context: Context) throws -> [LibraryListCellModel]
{
    try EntityType.allCases.map {
        try libraryListCellModel(for: $0, context: context)
    }
}

func libraryListCellModel(for entityType: EntityType, context: Context) throws -> LibraryListCellModel
{
    LibraryListCellModel(
        image: imageForEntityType(entityType),
        title: titleForEntityType(entityType),
        count: try countForEntityType(entityType, context: context))
}