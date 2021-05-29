//
//  Bundle+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 5/27/21.
//

import Foundation

extension Bundle
{
    var activityType: String
    {
        Bundle
            .main
            .infoDictionary?["NSUserActivityTypes"]
            .flatMap { ($0 as? [String])?.first }
            ?? ""
    }
}
