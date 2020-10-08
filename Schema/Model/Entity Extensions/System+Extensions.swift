//
//  System+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

extension System: Named { }

extension System
{
    public override var title: String {
        unwrappedName ?? ""
    }
}
