//
//  TransferFlow+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import Foundation

extension TransferFlow: Named { }

extension TransferFlow
{
    public override var title: String {
        unwrappedName ?? ""
    }
}
