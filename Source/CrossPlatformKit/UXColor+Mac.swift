//
//  UXColor+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//


#if os(OSX)
import AppKit
import Cocoa

public typealias UXColor = NSColor

extension NSColor {
	public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		self.init(calibratedRed: red, green: green, blue: blue, alpha: alpha)
	}
}
#endif
