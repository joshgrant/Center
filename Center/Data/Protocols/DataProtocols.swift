//
//  DataProtocols.swift
//  Center
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import RealmSwift

@objc protocol FlowProtocol
{
    
}

@objc protocol StockProtocol
{
    var amount: Double { get set }
    var amountType: AmountType { get set }
    var idealType: IdealType { get set }
    
    var inflows: [FlowProtocol] { get set }
    
    var symbol: Symbol! { get set }
    var history: History! { get set }
}

/// The `AmountType` is just a user-facing property that restricts how
/// the underlying value (which is always a double) is presented
@objc enum AmountType: Int, RealmEnum
{
    case Int
    case Double
    case Boolean
}

@objc enum IdealType: Int, RealmEnum
{
    /// The ideal value is calculated based on the delta to the ideal state
    case stateMachine
    
    /// The ideal value is just a value, not a range of values
    case value
    
    /// The ideal value is based on another stock's amount in the system
    case dynamic
}
