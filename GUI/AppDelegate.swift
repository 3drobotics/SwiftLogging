//
//  AppDelegate.swift
//  GUI
//
//  Created by Jonathan Wight on 5/15/15.
//  Copyright (c) 2015 schwa.io. All rights reserved.
//

import Cocoa

import SwiftLogging

//public var logger: Logger! = Logger()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        log.debug("My password is \"123456\"", tags: [sensitiveTag])
        log.debug("Poop: \n💩")
        log.debug("This is so verbose", tags: [verboseTag])
        log.debug("This is so very verbose", tags: [veryVerboseTag])

    }

    func applicationWillTerminate(aNotification: NSNotification) {
    }
}

