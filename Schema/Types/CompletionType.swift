//
//  CompletionType.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

/// The completion type for a flow?
public enum CompletionType: Int16
{
    // TODO: Not sure which completion type suits them all
    case boolean
    case children
}

extension CompletionType: FallbackProtocol
{
    static let fallback: CompletionType = .boolean
}
