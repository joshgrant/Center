//
//  Application.swift
//  RunLoopTest
//
//  Created by Joshua Grant on 10/15/20.
//

import UIKit

class Application: UIApplication
{
    override func sendEvent(_ event: UIEvent)
    {
        print("SEND EVENT")
        print("==========")
        super.sendEvent(event)
        print("==========")
    }
    
    override func sendAction(
        _ action: Selector,
        to target: Any?,
        from sender: Any?,
        for event: UIEvent?) -> Bool
    {
        print("SEND ACTION")
        print("===========")
        print(action)
        print(target)
        print(sender)
        print(event)
        print("===========")
        return super.sendAction(action, to: target, from: sender, for: event)
    }
}
