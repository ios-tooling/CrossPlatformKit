//
//  ImageRenderer.swift
//  
//
//  Created by Ben Gottlieb on 3/14/23.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension ImageRenderer {
	#if canImport(AppKit)
		@MainActor public var uxImage: NSImage? { nsImage }
	#elseif canImport(UIKit)
		@MainActor public var uxImage: UIImage? { uiImage }
	#endif
}
