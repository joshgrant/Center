//
//  System.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc protocol System: Entity
{
    func percentIdeal() -> Double
    
    func suggestedFlows() -> [Flow]
    
    func stocks() -> [Stock]
    func link(stock: Stock)
    
    func flows() -> [Flow]
    func link(flow: Flow)
    
    func events() -> [Event]
    func link(event: Event)
}
