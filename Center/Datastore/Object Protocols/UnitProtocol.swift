//
//  UnitProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol UnitProtocol: ObjectProtocol
{
    func getIsBaseUnit() -> Bool
    func setIsBaseUnit(_ isBaseUnit: Bool)
    
    func getUnitRelativeTo() -> UnitProtocol
    func setUnitRelativeTo(_ unit: UnitProtocol)
    
    func getRatioLeftHandSide() -> Double
    func getRatioRightHandSide() -> Double
}
