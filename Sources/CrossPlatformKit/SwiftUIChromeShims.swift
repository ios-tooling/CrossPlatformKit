//
//  SwiftUIChromeShims.swift
//  CrossPlatformKit
//
//  Cross-platform stand-ins for iOS-only navigation-chrome modifiers, so shared
//  SwiftUI screens compile on macOS. On macOS these degrade to no-ops / `.automatic`,
//  since the concepts (nav-bar title mode, top/bottom bar placement, keyboard
//  autocapitalization) don't apply there.
//

import SwiftUI

// MARK: - Toolbar item placements

#if os(iOS)
@available(iOS 17, *)
public extension ToolbarItemPlacement {
	/// Trailing edge of the navigation bar.
	static var uxTrailing: ToolbarItemPlacement { .topBarTrailing }
	/// The bottom toolbar.
	static var uxBottomBar: ToolbarItemPlacement { .bottomBar }
}
#else
public extension ToolbarItemPlacement {
	/// No dedicated trailing/bottom bars on macOS; fall back to `.automatic`.
	static var uxTrailing: ToolbarItemPlacement { .automatic }
	static var uxBottomBar: ToolbarItemPlacement { .automatic }
}
#endif

// MARK: - Text input autocapitalization

// macOS text fields have no autocapitalization concept and the SwiftUI modifier is
// absent there. Provide a matching no-op so `.textInputAutocapitalization(.never)`
// compiles unchanged in shared code.
#if os(macOS)
public struct TextInputAutocapitalization: Sendable {
	public init() {}
	public static let never = TextInputAutocapitalization()
	public static let sentences = TextInputAutocapitalization()
	public static let words = TextInputAutocapitalization()
	public static let characters = TextInputAutocapitalization()
}

public extension View {
	func textInputAutocapitalization(_ autocapitalization: TextInputAutocapitalization?) -> some View { self }
}
#endif
