//
//  UXImage+Mac.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Cocoa

public typealias UXImage = NSImage

extension NSImage {
	public func jpegData(withQuality quality: CGFloat = 0.9) -> Data? {
		let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil)!
		let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
		let jpegData = bitmapRep.representation(using: NSBitmapImageFileType.JPEG, properties: [NSImageCompressionFactor: quality])
		return jpegData
	}
	
	public func pngData() -> Data? {
		let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil)!
		let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
		let pngData = bitmapRep.representation(using: NSBitmapImageFileType.PNG, properties: [:])
		return pngData
	}
}

