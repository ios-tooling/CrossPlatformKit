//
//  UXView+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//


#if os(OSX)
import AppKit
import Cocoa

public typealias UXView = NSView

public extension NSView {
	func setNeedsDisplay() {
		self.setNeedsDisplay(self.bounds)
	}

	func extractImage() -> NSImage? {
		let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
		cacheDisplay(in: bounds, to: imageRepresentation)
		guard let image = imageRepresentation.cgImage else { return nil }
		return NSImage(cgImage: image, size: bounds.size)
	}
}

#endif
