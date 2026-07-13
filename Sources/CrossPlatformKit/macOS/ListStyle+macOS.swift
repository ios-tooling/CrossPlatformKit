//
//  ListStyle.swift
//  CrossPlatformKit
//
//  Created by Ben Gottlieb on 7/9/26.
//

import SwiftUI

@available(iOS 14.0, *)
public extension ListStyle where Self == InsetListStyle {
	static var insetGroup: InsetListStyle { Self() }
}
