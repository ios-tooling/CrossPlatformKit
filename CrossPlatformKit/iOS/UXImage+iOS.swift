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
}
