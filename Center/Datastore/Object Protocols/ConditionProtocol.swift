//
//  ConditionProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol ConditionProtocol
{
    func getStock() -> StockOverviewProtocol
    func getTarget() -> Any
    
    // Linear, quadratic, exponential, etc
    func getPriority() -> Any
    
    // Direct, inverse
    func getRelationship() -> Any
}
