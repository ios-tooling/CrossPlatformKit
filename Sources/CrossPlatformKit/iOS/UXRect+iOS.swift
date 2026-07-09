//
//  UXRect+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public typealias UXRect = CGRect

extension CGRect {
	public func fill() {
		UIRectFill(self)
	}
}
#endif
