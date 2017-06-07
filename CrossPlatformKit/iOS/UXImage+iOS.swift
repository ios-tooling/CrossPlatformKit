//
//  UXImage+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import UIKit

public typealias UXImage = UIImage

extension UIImage {
	public func jpegData(withQuality quality: CGFloat = 0.9) -> Data? {
		return UIImageJPEGRepresentation(self, quality)
	}
	
	public func pngData() -> Data? {
		return UIImagePNGRepresentation(self)
	}
	
	static public func create(size: CGSize, drawing: @escaping (CGContext) -> Void) -> UXImage {
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
