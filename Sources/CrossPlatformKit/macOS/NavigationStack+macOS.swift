//
//  NavigationStack+macOS.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 7/9/26.
//

import SwiftUI

#if os(macOS)

public enum TitleDisplayMode { case automatic, inline, large }

public extension View {
	@ViewBuilder func navigationBarTitleDisplayMode(_ mode: TitleDisplayMode) -> some View {
		self
	}
}
#endif
