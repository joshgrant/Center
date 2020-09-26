//
//  DataStoreProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import Foundation

protocol ObjectDataStoreProtocol
{
    func save()
    func undo()
    func redo()
    
    func deleteAllObjects()
    
    func populateWithSampleData(_ sampleData: Any)
}
