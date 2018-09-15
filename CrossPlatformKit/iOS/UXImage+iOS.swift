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
