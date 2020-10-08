//
//  Stock+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Stock
{
    var amountType: AmountType {
        get {
            AmountType(rawValue: amountTypeRaw) ?? .fallback
        }
        set {
            amountTypeRaw = newValue.rawValue
        }
    }
}

extension Stock
{
    var currentState: State {
        // TODO: Does every stock have a state machine?
        fatalError()
    }
}
