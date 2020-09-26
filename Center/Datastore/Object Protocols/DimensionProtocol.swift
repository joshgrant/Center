//
//  DimensionProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol DimensionProtocol: ObjectProtocol
{
    func getUnits() -> Any
    func linkUnit(_ unit: Any)
}

protocol DimensionOverviewProtocol
{
    func getSymbol() -> SymbolProtocol
    func getUnitsCount() -> Int
}
