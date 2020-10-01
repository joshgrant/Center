//
//  Object.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

class Object: ObjectModel
{
    enum CodingKeys: CodingKey
    {
        case id
        case className
        case properties
        case relationships
    }
    
    let id: UUID = .init()
    
    var properties: [PropertyModel]
    var relationships: [RelationshipModel]
    
    init(properties: [PropertyModel],
         relationships: [RelationshipModel])
    {
        self.properties = properties
        self.relationships = relationships
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        properties = try container.decode([PropertyModel].self, forKey: .properties)
        relationships = try container.decode([RelationshipModel].self, forKey: .relationships)
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(className, forKey: .className)
        try container.encode(id, forKey: .id)
        try container.encode(properties, forKey: .properties)
        try container.encode(relationships, forKey: .relationships)
    }
}
