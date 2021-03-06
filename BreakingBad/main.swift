//
//  main.swift
//  BreakingBad
//
//  Created by stringcode on 07/01/2021.
//

import UIKit

autoreleasepool {
    
    _ = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
        to: UnsafeMutablePointer<Int8>.self,
        capacity: Int(CommandLine.argc)
    )

    let delegateClass: AnyClass
    
    if let unitTestClass = NSClassFromString("UnitTestAppDelegate") {
        delegateClass = unitTestClass
    } else if let uiTestClass = NSClassFromString("UITestAppDelegate") {
        delegateClass = uiTestClass
    } else {
        delegateClass = AppDelegate.self
    }
    
    UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        nil,
        NSStringFromClass(delegateClass)
    )
}
