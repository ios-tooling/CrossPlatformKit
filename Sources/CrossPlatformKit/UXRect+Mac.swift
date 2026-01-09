//
//  UXRect+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//


#if canImport(AppKit)
import AppKit

public typealias UXRect = NSRect

extension NSRect {
	public func fill() {
		NSBezierPath(rect: self).fill()
	}
}
#endif
