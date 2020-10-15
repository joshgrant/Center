//
//  main.swift
//  RunLoopTest
//
//  Created by Joshua Grant on 10/15/20.
//

import UIKit

let principalClassName: String? = NSStringFromClass(Application.self)
let delegateClassName: String? = NSStringFromClass(AppDelegate.self)

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    principalClassName,
    delegateClassName)
