//
//  FlowStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol FlowStorage
{
    func flows() -> [Flow]
    func append(flow: Flow) throws
    func remove(flow: Flow) throws
    
    /*
     func processFlows() -> [ProcessFlow]
     func append(processFlow: ProcessFlow) throws
     func remove(processFlow: ProcessFlow) throws
     
     func transferFlows() -> [TransferFlow]
     func append(transferFlow: TransferFlow) throws
     func remove(transferFlow: TransferFlow) throws
     */
}
