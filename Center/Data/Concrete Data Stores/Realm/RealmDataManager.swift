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
    let realm: Realm = {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to configure Realm: \(error)")
        }
    }()
    
    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
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
        
        let symbols = realm.objects(Symbol.self)
        
        guard symbols.count == 0 else {
            print("Data already exists in the database.")
            return
        }
        
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
