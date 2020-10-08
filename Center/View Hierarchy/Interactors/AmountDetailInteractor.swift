//
//  AmountDetailInteractor.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema
 
enum AmountDetailChartType
{
    case linear
    case logarithmic
}

protocol AmountDetailInteractor
{
    func goBack()
    func share()
    
    func beginEditingCurrentValue()
    func endEditingCurrentValue()
    
    func beginEditingChartFromDate()
    func endEditingChartToDate()
    
    func setChartType(to chartType: AmountDetailChartType)
    
    func select(history: History)
}
