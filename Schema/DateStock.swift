//
//  DateStock.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

func makeDateStockPredicate() -> NSPredicate
{
    NSPredicate(format: "name == %@", SourceType.date.name)
}

func makeDateStockFetchRequest() -> NSFetchRequest<Stock>
{
    let fetchRequest: NSFetchRequest<Stock> = Stock.fetchRequest()
    fetchRequest.predicate = makeDateStockPredicate()
    fetchRequest.fetchLimit = 1
    return fetchRequest
}

func findDateStock(dataManager: DataManager) -> Stock?
{
    let fetchRequest = makeDateStockFetchRequest()
    let result = performFetchRequest(fetchRequest: fetchRequest, dataManager: dataManager)
    return result.first
}

func makeDateStock(dataManager: DataManager) -> Stock
{
    // TODO: This should only be called once...
    
    if let stock = findDateStock(dataManager: dataManager) {
        return stock
    }
    
    let stock = Stock(context: dataManager.context)
    stock.amountType = .decimal
    stock.name = makeDateStockName(dataManager: dataManager)
    return stock
}

func makeDateStockName(dataManager: DataManager) -> Symbol
{
    let symbol = Symbol(context: dataManager.context)
    symbol.name = SourceType.date.name
    return symbol
}
