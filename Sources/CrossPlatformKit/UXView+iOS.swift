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
import SwiftUI

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

public protocol UXViewRepresentable: UIViewRepresentable {
	associatedtype UXViewType: UIView
	func makeUXView(context: Context) -> UXViewType
	func updateUXView(_ uiView: UXViewType, context: Context)
}

public extension UXViewRepresentable {
	func makeUIView(context: Context) -> UXViewType {
		makeUXView(context: context)
	}
	
	func updateUIView(_ uiView: UXViewType, context: Context) {
		updateUXView(uiView, context: context)
	}
}


#endif
#endif
