//
//  ToolbarPlacement.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 7/9/26.
//

import SwiftUI

#if os(macOS)

@available(macOS 13.0, *)
@MainActor public extension ToolbarPlacement {
	static var navigationBar: ToolbarPlacement { .automatic }
	static var topBarTrailing: ToolbarItemPlacement { .automatic }
	static var bottomBar: ToolbarItemPlacement { .automatic }
}
#endif
