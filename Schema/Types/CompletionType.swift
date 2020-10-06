//
//  CompletionType.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

public enum CompletionType: Int16
{
    // TODO: Not sure which completion type suits them all
    case children
    case boolean
}

extension CompletionType: FallbackProtocol
{
    static let fallback: CompletionType = .boolean
}
