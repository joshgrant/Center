//
//  ObjectModel.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

protocol ObjectModel: Codable
{
    var id: UUID { get }
    
    static var className: String { get }
    
    var className: String { get }
    
    var properties: [PropertyModel] { get set }
    
    var relationships: [RelationshipModel] { get set }
}

extension ObjectModel
{
    static var className: String
    {
        String(describing: Self.self)
    }
    
    var className: String
    {
        String(describing: self)
    }
}
