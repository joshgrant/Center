//
//  List+Extensions.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

extension List
{
    func remove(object: Element) throws
    {
        guard let index = self.index(of: object) else {
            throw RealmError.noObjectIndex
        }
        
        self.remove(at: index)
    }
}
