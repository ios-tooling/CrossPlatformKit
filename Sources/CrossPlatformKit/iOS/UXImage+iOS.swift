//
//  UXImage+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public typealias UXImage = UIImage

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, watchOS 7.0, *)
extension Image {
	public init(uxImage: UXImage) {
		self.init(uiImage: uxImage)
	}
}

@available(iOS 13.0, watchOS 7.0, *)
public extension UIImage {
	var image: Image {
		Image(uiImage: self)
	}
}
#endif

#if os(iOS) || os(visionOS) || os(watchOS)

extension UIImage {
	public convenience init?(data: Data?) {
		guard let data else { return nil }
		
		self.init(data: data)
	}
	
	public convenience init?(url: URL?) {
		guard let url, url.isFileURL else { return nil }
		
		self.init(contentsOfFile: url.path)
	}

	static public func create(size: CGSize, drawing: (CGContext) -> Void) -> UXImage? {
		return UIGraphicsImageRenderer(size: size).image { renderer in
			guard let ctx = UIGraphicsGetCurrentContext() else {
				print("⚠️ UIGraphicsGetCurrentContext() Failed")
				return
			}

			drawing(ctx)
		}
	}
	
//	public func create(size: CGSize, bitsPerPixel: Int, colorspace: CGColorSpace? = nil, data: Data) -> UXImage? {
//		return nil
//	}

	
}
#endif
#endif
