//
//  ListStyle.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 7/9/26.
//

import SwiftUI

#if os(macOS)
public extension ListStyle where Self == InsetListStyle {
	static var insetGrouped: InsetListStyle { InsetListStyle.inset }
}
#endif
