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
import SwiftUI

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

public protocol UXViewRepresentable: NSViewRepresentable {
	associatedtype UXViewType: NSView
	func makeUXView(context: Context) -> UXViewType
	func updateUXView(_ nsView: UXViewType, context: Context)
}

public extension UXViewRepresentable {
	func makeNSView(context: Context) -> UXViewType {
		makeUXView(context: context)
	}
	
	func updateNSView(_ nsView: UXViewType, context: Context) {
		updateUXView(nsView, context: context)
	}
}


#endif
