//
//  Bundle+Mac.swift
//  CrossPlatformKit_Mac
//
//  Created by Ben Gottlieb on 7/6/17.
//  Copyright © 2017 Stand Alone, inc. All rights reserved.
//

import Foundation

#if canImport(AppKit)
import AppKit

extension Bundle {
	public func image(named name: String) -> NSImage? {
		return self.image(forResource: NSImage.Name(name))
	}
}
#endif
