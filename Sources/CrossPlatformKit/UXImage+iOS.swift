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

@available(iOS 13.0, watchOS 8.0, macOS 12.0, *)
extension Image {
	public init(uxImage: UXImage) {
		self.init(uiImage: uxImage)
	}
}
#endif

#if os(iOS) || os(visionOS)

extension UIImage {
	static public func create(size: CGSize, drawing: @escaping (CGContext) -> Void) -> UXImage? {
		if #available(iOS 10, *) {
			return UIGraphicsImageRenderer(size: size).image { renderer in
				guard let ctx = UIGraphicsGetCurrentContext() else {
					print("⚠️ UIGraphicsGetCurrentContext() Failed")
					return
				}
				
				drawing(ctx)
			}
		} else {
			UIGraphicsBeginImageContextWithOptions(size, false, 0)
			guard let ctx = UIGraphicsGetCurrentContext() else {
				print("⚠️ UIGraphicsGetCurrentContext() Failed")
				return nil
			}
			
			drawing(ctx)
			let image = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			return image
		}
	}
	
//	public func create(size: CGSize, bitsPerPixel: Int, colorspace: CGColorSpace? = nil, data: Data) -> UXImage? {
//		return nil
//	}

	
}
#endif
#endif
