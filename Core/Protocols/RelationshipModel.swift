//
//  RelationshipModel.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

protocol RelationshipModel: Codable
{
    var from: ObjectModel.Type { get set }
    var to: ObjectModel.Type { get set }
    var type: RelationshipType { get set }
}

enum RelationshipType: Int
{
    case oneToOne
    case oneToMany
    case manyToMany
}
