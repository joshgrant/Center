//
//  FlowDetailViewModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct FlowDetailViewModel
{
    var title: String
    var amount: Double
    var from: String
    var to: String
    var duration: String
    var requireUserCompletion: Bool
    
    var events: [Event]
}
