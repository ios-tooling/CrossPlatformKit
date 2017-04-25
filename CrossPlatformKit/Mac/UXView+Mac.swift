//
//  UXView+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Cocoa

public typealias UXView = NSView

extension NSView {
	public func setNeedsDisplay() {
		self.setNeedsDisplay(self.bounds)
	}
}
