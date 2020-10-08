//
//  SourceType.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public enum SourceType: Int16
{
    case date
    case uptime
    case timeSinceLaunch
    case timeSinceDownload
    case timeSinceForeground
    
    var name: String {
        switch self {
        case .date: return "date"
        case .uptime: return "uptime"
        case .timeSinceLaunch: return "timeSinceLaunch"
        case .timeSinceDownload: return "timeSinceDownload"
        case .timeSinceForeground: return "timeSinceForeground"
        }
    }
}

extension SourceType: FallbackProtocol
{
    static let fallback: SourceType = .date
}
