//
//  Entity+Extensions.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

extension Entity
{    
    func unwrap<T>() throws -> T
    {
        guard let object = self as? T else {
            throw RealmError.unwrap
        }
        
        return object
    }
}
