//
//  FlowDetailViewController.swift
//  Center
//
//  Created by Joshua Grant on 6/3/21.
//

import Foundation

class FlowDetailViewController: ViewController
{
    var model: FlowDetailViewModel?
}

struct FlowDetailViewModel
{
    var flow: TransferFlow
    
    var title: String { flow.title }
    
    var amount: String { "\(flow.amount)" }
        
    var from: String { flow.from?.title ?? "None" }
    
    var to: String { flow.to?.title ?? "None" }
    
    var duration: String { "\(flow.duration)" }
    
    var requireUserCompletion: String { flow.requiresUserCompletion ? "Yes" : "No" }
    
    var events: [Event]? { flow.events?.toArray() }
    
    var history: [Event]? { flow.history?.toArray() }
}
