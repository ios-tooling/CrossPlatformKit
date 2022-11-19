//
//  UXView+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if canImport(UIKit)
#if os(iOS)
import UIKit

public typealias UXView = UIView

public extension UIView {
	func extractImage() -> UIImage? {
		let renderer = UIGraphicsImageRenderer(size: bounds.size)
		let image = renderer.image { ctx in
			 self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
		}
		
		return image
	}
}

#endif
#endif
