//
//  StockStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol StockStorage
{
    func stocks() -> [Stock]
    func append(stock: Stock) throws
    func remove(stock: Stock) throws
}
