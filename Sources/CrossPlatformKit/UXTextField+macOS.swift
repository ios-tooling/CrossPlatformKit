//
//  UXTextField+mac.swift
//
//
//  Created by Ben Gottlieb on 7/22/23.
//

#if canImport(AppKit)
import AppKit


public typealias UXTextField = NSTextField


extension UXTextField {
	public func selectAll() {
		selectText(nil)
	}
}
#endif
