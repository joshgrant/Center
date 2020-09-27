//
//  CenterCoreDataModel.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class CenterCoreDataModel: NSManagedObjectModel
{
    override init()
    {
        super.init()
        
        self.entities = [
            BaseObject.entity(),
            Event.entity(),
            Condition.entity(),
            Flow.entity(),
            History.entity(),
            Symbol.entity(),
            Note.entity()
        ]
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
