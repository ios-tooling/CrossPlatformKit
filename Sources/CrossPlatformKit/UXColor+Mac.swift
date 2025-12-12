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
#if canImport(SwiftUI)
	import SwiftUI
#endif

public typealias UXColor = NSColor

public extension NSColor {
	convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		self.init(calibratedRed: red, green: green, blue: blue, alpha: alpha)
	}
	
	static var defaultBackground: NSColor { NSColor.windowBackgroundColor }
}

@available(macOS 12.0, *)
public extension Color {
	init(uxColor: UXColor) {
		self.init(nsColor: uxColor)
	}
}

@available(macOS 12.0, *)
public extension UXColor {
	var color: Color { Color(uxColor: self) }
}

#endif
