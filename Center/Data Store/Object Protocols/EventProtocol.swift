//
//  EventProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol EventProtocol: ObjectProtocol
{
    func getIsActive() -> Bool
    func setIsActive(_ isActive: Bool)
    
    func getConditions() -> [Any]
    
    func getFlows() -> [FlowProtocol]
    func linkFlow(_ flow: FlowProtocol)
    func unlinkFlow(_ flow: FlowProtocol)
    
    func getHistory() -> [Any]
    
    // MARK: - Caching
    
    func getFlowsCount() -> Int
    func getHistoryCount() -> Int
}
