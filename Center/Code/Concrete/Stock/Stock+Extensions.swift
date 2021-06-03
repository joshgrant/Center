//
//  Stock+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension Stock: Named {}

extension Stock
{
    var amountType: AmountType
    {
        get
        {
            AmountType(rawValue: amountTypeRaw) ?? .fallback
        }
        set
        {
            amountTypeRaw = newValue.rawValue
        }
    }
    
    var unwrappedValidStates: [State]
    {
        get
        {
            validStates?.toArray() ?? []
        }
        set
        {
            validStates = NSSet(array: newValue)
        }
    }
}

extension Stock
{
    var currentValue: Any?
    {
        return amount?.computedValue
    }
}

extension Stock
{
    var typeDescription: String
    {
        return amountType.description
    }
    
    var dimensionDescription: String
    {
        return dimension?.title ?? "None"
    }
    
    var currentDescription: String
    {
        return "\(currentValue ?? "")"
    }
    
    var netDescription: String
    {
        // Uses the history to figure out
        // a timeframe and a value
        return "Need to compute"
    }
}
