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
        print("SEND EVENT")
        print("==========")
        print(event)
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
        
        if let target = target
        {
            print(target)
        }
        
        if let sender = sender
        {
            print(sender)
        }
        
        if let event = event
        {
            print(event)
        }
        print("===========")
        return super.sendAction(action, to: target, from: sender, for: event)
    }
}
