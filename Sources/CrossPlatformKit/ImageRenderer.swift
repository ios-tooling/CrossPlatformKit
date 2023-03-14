//
//  ImageRenderer.swift
//  
//
//  Created by Ben Gottlieb on 3/14/23.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension ImageRenderer {
	#if os(macOS)
		@MainActor public var uxImage: NSImage? { nsImage }
	#endif
		
	#if os(iOS)
		@MainActor public var uxImage: UIImage? { uiImage }
	#endif
		
	#if os(watchOS)
		@MainActor public var uxImage: UIImage? { uiImage }
	#endif
}
