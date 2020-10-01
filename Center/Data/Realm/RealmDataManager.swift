//
//  RealmDataManager.swift
//  Center
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

class RealmDataManager: DataManagerProtocol
{
    func save()
    {
        print("SAVE")
    }
    
    func undo()
    {
        print("UNDO")
    }
    
    func redo()
    {
        print("REDO")
    }
    
    func deleteAllObjects()
    {
        print("DELETE IT ALL")
    }
    
    func populateWithSampleData()
    {
        print("POPULATE")
        
        let realm = try! Realm()
        
        try! realm.write {
            let symbol = Symbol()
            symbol.name = "Food"
            let stock = Stock()
            stock.symbol = symbol
            realm.add(symbol)
            realm.add(stock)
        }
    }
}
