//
//  UXView+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Cocoa

#if canImport(AppKit)
import AppKit

public typealias UXView = NSView

extension NSView {
	public func setNeedsDisplay() {
		self.setNeedsDisplay(self.bounds)
	}
}

#endif
