//
//  ConversionProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol ConversionProtocol {
    
    func getSymbolFrom() -> SymbolProtocol
    func setSymbolFrom(_ symbol: SymbolProtocol)
    
    func getSymbolTo() -> SymbolProtocol
    func setSymbolTo(_ symbol: SymbolProtocol)
    
    func getRatioLeftHandSide() -> Double
    func setRatioLeftHandSide(_ leftHandSide: Double)
    
    func getRatioRightHandSide() -> Double
    func setRatioRightHandSide(_ rightHandSide: Double)
    
    func getIsReversible() -> Bool
    func setIsReversible(_ isReversible: Bool)
}
