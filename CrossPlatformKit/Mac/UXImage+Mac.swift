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
		let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [NSBitmapImageRep.PropertyKey.compressionFactor: quality])
		return jpegData
	}
	
	public func pngData() -> Data? {
		let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil)!
		let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
		let pngData = bitmapRep.representation(using: NSBitmapImageRep.FileType.png, properties: [:])
		return pngData
	}
	
	static public func create(size: CGSize, drawing: (CGContext) -> Void) -> UXImage? {
		let image = NSImage(size: size)
		image.lockFocus()
		if let ctx = CGContext.current {
			drawing(ctx)
		} else {
			print("⚠️ CGContext.current Failed")
		}
		image.unlockFocus()
		return image
	}
	
	public convenience init(cgImage: CGImage) {
		self.init(cgImage: cgImage, size: NSSize.zero)
	}

//	public func create(size: CGSize, bitsPerComponent: Int, bytesPerRow: Int, colorspace: CGColorSpace? = nil, data: UnsafeMutableRawPointer) -> UXImage? {
//		return nil
//	}
}

