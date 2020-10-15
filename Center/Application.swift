//
//  Application.swift
//  Center
//
//  Created by Joshua Grant on 10/15/20.
//

import UIKit

class Application: UIApplication
{
    override func sendEvent(_ event: UIEvent)
    {
        super.sendEvent(event)
    }
    
    override func sendAction(
        _ action: Selector,
        to target: Any?,
        from sender: Any?,
        for event: UIEvent?) -> Bool
    {
        return super.sendAction(action, to: target, from: sender, for: event)
    }
}
