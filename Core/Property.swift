//
//  Property.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

struct Property
{
    var label: String
    var value: Any
    
    init(mirrorChild: Mirror.Child)
    {
        guard let childLabel = mirrorChild.label else {
            preconditionFailure("The mirror child must have a valid label")
        }
        
        self.label = childLabel
        self.value = mirrorChild.value
    }
}

extension Property: CustomStringConvertible
{
    var description: String
    {
        return "\(label): \(value)"
    }
}
