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
//		let data = dataWithPDF(inside: bounds)
//		return NSImage(data: data)

		let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
		cacheDisplay(in: bounds, to: imageRepresentation)
		let image = imageRepresentation
		let result = NSImage(size: CGSize(width: bounds.width, height: bounds.height))
		result.addRepresentation(image)
		return result
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
