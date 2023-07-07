//
//  AppDelegate.swift
//  QuadraticEquation
//
//  Created by Maxim Kovalko on 7/6/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window.contentViewController = QuadraticEquationViewController(
            nibName: "QuadraticEquationViewController",
            bundle: nil,
            quadraticEquationSolver: QuadraticEquationSolver()
        )
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
