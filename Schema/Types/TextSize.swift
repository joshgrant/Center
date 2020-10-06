//
//  TextSize.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum TextSize: Int16
{
    case header
    case sectionTitle
    case body
    case caption
}

extension TextSize: FallbackProtocol
{
    static let fallback: TextSize = .body
}
