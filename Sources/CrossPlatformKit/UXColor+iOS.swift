//
//  UXColor+iOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 3/17/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#if canImport(SwiftUI)
	import SwiftUI
#endif

public typealias UXColor = UIColor


@available(iOS 13.0, *)
public extension Color {
	init(uxColor: UXColor) {
		self.init(uxColor)
	}
}

@available(iOS 13.0, *)
public extension UXColor {
	var color: Color { Color(uxColor: self) }
}

#endif
