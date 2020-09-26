//
//  EventProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol EventProtocol: ObjectProtocol
{
    func getSymbol() -> SymbolProtocol
    func setSymbol(_ symbol: SymbolProtocol)
    
    func getIsActive() -> Bool
    func setIsActive(_ isActive: Bool)
    
    func getConditions() -> [Any]
    
    func getFlowOverviews() -> [FlowOverviewProtocol]
    func linkFlow(_ flow: Flow)
    func unlinkFlow(_ flow: Flow)
    
    func getHistoryOverviews() -> [Any]
}

protocol EventOverviewProtocol
{
    func getSymbol() -> SymbolProtocol
    func setSymbol(_ symbol: SymbolProtocol)
    
    func getFlowsCount() -> Int
}
